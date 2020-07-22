class ApplicationController < ActionController::Base
    protected
    def populate_data
        offset = Offset.find_or_initialize_by(bot_id: session[:bot_id])
        updates = Telegram.bot.get_updates(offset: offset.offset+1)
        max_offset = 0
        if updates["ok"]
            updates["result"].each do |update|
                max_offset = update["update_id"]
                Message.create(message_id: update["message"]["message_id"], date: update["message"]["date"], text: update["message"]["text"], chat_id: update["message"]["chat"]["id"], sender_id: update["message"]["from"]["id"])
                chat = Chat.find_or_initialize_by(id: update["message"]["chat"]["id"])
                chat.first_name = update["message"]["chat"]["first_name"]
                chat.last_name = update["message"]["chat"]["last_name"]
                chat.username = update["message"]["chat"]["username"]
                chat.bot_id = session[:bot_id]
                chat.save
            end
            if offset.offset < max_offset
                offset.offset = max_offset
                offset.save
            end
        else
            puts "you failed"
        end
    end
end

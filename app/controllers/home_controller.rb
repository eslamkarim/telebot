class HomeController < ApplicationController
  before_action :load_entities
    def index
        populate_data
        @bot_id = session[:bot_id]
        @bot_username = session[:bot_username]
        if !@bot_id
            redirect_to sign_in_path
        end
        @chats = Chat.all
    end

    def show
        populate_data
        @bot_username = session[:bot_username]
        @chat = Chat.find(params[:chat_id])
    end

    def clear_token
        @bot_token = session[:bot_token] = nil
        @bot_id = session[:bot_id] = nil
        @bot_username = session[:bot_username] = nil
        Telegram.bots_config = {
            default: nil
          }
        redirect_to '/sign_in'
    end

    def send_message
        puts params
        resp = Telegram.bot.send_message(chat_id: params[:chat_id], text: params[:message_text])
        if resp["ok"]
            Message.create(message_id: resp["result"]["message_id"], date: resp["result"]["date"], text: resp["result"]["text"], chat_id: resp["result"]["chat"]["id"], sender_id: resp["result"]["from"]["id"])
            puts resp.to_yaml
        else
            flash[:danger] = "failed to send message"
        end
        redirect_to chat_path(chat_id: params[:chat_id])
    end

    def load_entities
        populate_data
        @chats = Chat.all
        @chat = Chat.find(params[:id]) if params[:id]
    end
    
end


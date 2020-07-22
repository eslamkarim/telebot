class BotSigninController < ApplicationController
    def show
        @bot = session[:bot_id]
        @bot_username = session[:bot_username]
    end

    def add_bot
        session[:bot_token]=params[:Bot_Token]
        Telegram.bots_config = {
            default: params[:Bot_Token]
          }
        Telegram::Bot::Client.new(params[:Bot_Token])
        resp = Telegram.bot.get_me
        puts resp["result"]["id"]
        resp.each do |key, value|
            puts "#{key}:#{value}"
        end
        if resp["ok"]
            session[:bot_id] = resp["result"]["id"]
            session[:bot_username] = resp["result"]["username"]
            populate_data
            redirect_to '/'
        else
            puts "can't find bot"
            redirect_to '/sign_in'
        end
    end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: :home
  get '/sign_in', to: 'bot_signin#show'
  post '/sign_in' , to: 'bot_signin#add_bot',as: :add_bot
  get '/clear-token', to: 'home#clear_token', as: :clear_token
  get '/show/:chat_id', to: 'home#show', as: :chat
  post '/send_message/:chat_id' , to: 'home#send_message',as: :send_message


end

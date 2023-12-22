Rails.application.routes.draw do
  get '/get_card_status', to: 'card_status#get_card_status'
end

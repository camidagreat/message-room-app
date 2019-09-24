Rails.application.routes.draw do
  resources :messages
  resources :message_rooms
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  post 'messages/ajax_submit'
  post 'message_rooms/subscribe'
  delete 'message_rooms/unsubscribe'
end

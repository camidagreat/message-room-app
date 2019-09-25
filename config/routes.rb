Rails.application.routes.draw do
  resources :messages
  resources :message_rooms
  devise_for :users

  # action cable route
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  post 'message_rooms/subscribe'
  post 'message_rooms/:id', to: 'message_rooms#ajax_message'
end

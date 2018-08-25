Rails.application.routes.draw do
  #devise_for :users
  devise_for :models
  get 'poojas/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=begin  Rails.application.routes.draw do
       devise_for :users, controllers: {
         sessions: 'users/sessions'
       }
     end
=end
  devise_for :users, controllers: { sessions: 'users/sessions',registrations: "users/registrations", passwords: 'users/passwords' }

  root 'poojas#index'
  get  'poojas/:id', to: 'poojas#pooja', as: 'poojas_pooja'
  #confirm email token
  get 'emails/', to: 'emails#confirm_email_token'
  #change password
  get 'passwords/', to: 'passwords#change_password'
  resources :orders
  resources :customer_addresses
end

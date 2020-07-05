Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users
  root 'post_image#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

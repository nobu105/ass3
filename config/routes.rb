Rails.application.routes.draw do
  root "books#top"
  get "home/about" => "books#about"
  devise_for :users, controllers: {
        sessions:      'users/sessions',
        registrations: 'users/registrations'
    }

  resources :books
  resources :users


    # see http://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


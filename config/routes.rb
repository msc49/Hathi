Rails.application.routes.draw do
  resources :chatrooms
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
  get 'user/:id', to: 'users#show', as: 'user'
end

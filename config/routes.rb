Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users
  resources :accounts do
    resources :comments
  end
  resources :movies do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

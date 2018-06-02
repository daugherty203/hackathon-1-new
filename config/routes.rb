Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/edit'
  get 'comments/delete'
  root to: 'accounts#index'
  devise_for :users
  resources :accounts
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

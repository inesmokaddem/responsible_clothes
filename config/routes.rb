Rails.application.routes.draw do
  devise_for :users
  root to: 'scans#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:show, :new, :create]
  resources :scans, only: [:new, :create]
end

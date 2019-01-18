Rails.application.routes.draw do
  devise_for :users
  root to: 'scans#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show, :new, :create], shallow: true do
    resources :favorites, only: [:create]
    resources :reviews, only: [ :new, :create, :index ]
  end
  resources :scans, only: [:create]
  resources :favorites, only: [:index]
  resources :users, only: [:show, :edit, :update]
end

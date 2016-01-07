Rails.application.routes.draw do
  devise_for :travellers
  resources :journeys, only: [:index, :new, :create]
  resources :items, only: [:create, :new, :edit, :update]
  root to: 'journeys#index'
end

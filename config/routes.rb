Rails.application.routes.draw do
  devise_for :travellers
  resources :journeys, only: [:index, :new, :create]
  root to: 'journeys#index'
end

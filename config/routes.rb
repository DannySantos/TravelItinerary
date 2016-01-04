Rails.application.routes.draw do
  resources :journeys, only: [:index, :new, :create]
  root to: 'journeys#index'
end

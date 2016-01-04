Rails.application.routes.draw do
  resources :journeys, only: [:index]
  root to: 'journeys#index'
end

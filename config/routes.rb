Rails.application.routes.draw do
  devise_for :travellers
  resources :journeys, only: [:index, :new, :create] do
    member do
      get :map
    end
  end
  resources :items, only: [:create, :new, :edit, :update, :destroy]
  resources :properties, only: [:index, :new, :create]
  root to: 'home#index'
end

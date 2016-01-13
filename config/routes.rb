Rails.application.routes.draw do
  devise_for :travellers, :controllers => { :omniauth_callbacks => "travellers/omniauth_callbacks" }
  resources :journeys, only: [:index, :new, :create] do
    member do
      get :map
    end
  end
  resources :items, only: [:create, :new, :edit, :update, :destroy]
  resources :properties, only: [:index, :new, :create] do
    collection do
      get :view_rentals
    end
  end
  root to: 'home#index'
end

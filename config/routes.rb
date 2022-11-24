Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :cars do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:show, :edit, :update, :destroy] do
    member do
      patch :change_status
    end
  end
  resources :dashboard, only: [:show]
end

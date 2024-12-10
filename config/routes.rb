Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :flats do
    resources :bookings, only: [:new, :create, :index]
  end
  resources :hosts
  resources :guests
end

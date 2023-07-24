Rails.application.routes.draw do
  root "home#index"
  get 'home/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :job_offers, only: [:new, :create] do
    resources :applications, only: [:new, :create] # Define las rutas de applications dentro de job_offers
  end

end

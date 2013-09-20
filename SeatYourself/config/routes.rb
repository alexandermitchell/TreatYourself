Seatyourself::Application.routes.draw do
  root "home#index"
  
  resources :owners, except: :index

  resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants

  resources :customers, except: :index
end

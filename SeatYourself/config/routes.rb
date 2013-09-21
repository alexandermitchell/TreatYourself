Seatyourself::Application.routes.draw do
  root "home#index"
  
  resources :owners, except: :index

  resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants do
  	resources :reservation, except: :index
  end

  resources :customers, except: :index do
  	resources :reservation, only: :index
  end

end

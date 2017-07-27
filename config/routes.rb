Rails.application.routes.draw do
  
  get '/pages/about', to: 'pages#show_about'

  get 'pages/contact', to: 'pages#show_contact'

  get 'pages/forms', to: 'pages#show_forms'

  root 'pages#welcome'

  post 'payrolls/:id/payperiods', to: 'payrolls#create'

  resources :checks, only: [:index, :new, :create, :show]
  resources :employees
  resources :todos, except: [:edit, :patch, :show]
  resources :payrolls, only: [:new, :index, :show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :payperiods, only: [:show]

  post '/payrolls/:id/payperiods', to: 'payrolls#create'
  get '/payrolls/:id/payperiods', to: 'payrolls#show', as: 'pay_period'

  get '/login', to: 'sessions#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

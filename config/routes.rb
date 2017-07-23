Rails.application.routes.draw do
  
  get '/pages/about', to: 'pages#show_about'

  get 'pages/contact', to: 'pages#show_contact'

  get 'pages/forms', to: 'pages#show_forms'

  root 'pages#welcome'

  resources :employees
  resources :todos
  resources :payrolls, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

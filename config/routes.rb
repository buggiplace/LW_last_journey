Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: 'funerals#dashboard', as: :funerals_dashboard
  # get "funerals/:id/funeral_type", to: 'funerals#funeral_type', as: :funerals_funeral_type
  # resources :funerals, only: :show
end


  # get "funeral/:id/representative"
  # get "funeral/:id/funeral_type"
  # get "funeral/:id/funeral_type"
  # get "funeral/:id/funeral_type"




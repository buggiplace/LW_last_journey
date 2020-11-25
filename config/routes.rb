Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: 'funerals#dashboard', as: :funerals_dashboard

  get "/documents", to: 'funerals#documents', as: :funerals_documents
  patch "/documents", to: 'funerals#update_documents', as: :update_documents

  # get "/representative", to: 'funerals#representative', as: :funerals_representative
  # patch "/representative", to: 'funerals#update_representativ'

  # get "/music", to: 'funerals#music', as: :funerals_music
  # patch "/music", to: 'funerals#update_music'

  # get "/digital_will", to: 'funerals#digital_will', as: :funerals_digital_will
  # patch "/digital_will", to: 'funerals#update_digital_will'

  # get "/obituary", to: 'funerals#obituary', as: :funerals_obituary
  # patch "/obituary", to: 'funerals#update_obituary'

  # get "/guestlist", to: 'funerals#guestlist', as: :funerals_guestlist
  # patch "/guestlist", to: 'funerals#update_guestlist'

  # get "/funeral_type", to: 'funerals#funeral_type', as: :funerals_funeral_type
  # patch "/funeral_type", to: 'funerals#update_funeral_type'


  # get "funerals/:id/funeral_type", to: 'funerals#funeral_type', as: :funerals_funeral_type
  # resources :funerals, only: :show
end


  # get "funeral/:id/representative"
  # get "funeral/:id/funeral_type"
  # get "funeral/:id/funeral_type"
  # get "funeral/:id/funeral_type"



#          Prefix  Verb    URI Pattern            Controller#Action
#     restaurants  GET     /restaurants           restaurants#index
#                  POST    /restaurants           restaurants#create
#  new_restaurant  GET     /restaurants/new       restaurants#new
# edit_restaurant  GET     /restaurants/:id/edit  restaurants#edit
#      restaurant  GET     /restaurants/:id       restaurants#show
#                  PATCH   /restaurants/:id       restaurants#update
#                  DELETE  /restaurants/:id       restaurants#destroy

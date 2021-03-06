Rails.application.routes.draw do
  get 'locations/index'
  resources 'condolences', only: [:destroy]
  devise_for :users
  root to: 'pages#home'
  get "/blog", to: 'pages#blog'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: 'funerals#dashboard', as: :funerals_dashboard
  # get "/guestlist", to: 'funerals#guestlist'
  # patch "/guestlist", to: 'obituary#update_guestlist'

  resources :funeral_types, only: [:show, :update]
  resources :digital_wills, only: [:show, :update]
  resources :playlists, only: [:show, :update]
  resources :representatives, only: [:show, :update]
  resources :funerals, only: [] do
    resources :documents, only: [:index, :create, :destroy]
    get "/representative", to: 'funerals#new_rep', as: :assign_rep
    post "/representative", to: 'funerals#create_rep', as: :create_rep
  end
  resources :obituary, only: [:show, :update]
  # resources :condolences, only: [:new, :create ]
  get 'public_obituary/:obituary_id', to: 'public_obituary#show', as: :public_obituary
  post 'public_obituary/:obituary_id/condolences', to: 'public_obituary#create_condolences', as: :create_condolence
end


  # get "/funeral_types", to: 'funeral_types#show'
  # get "/funeral_types", to: 'funeral_types#edit'
  # post "/funeral_types", to: 'funeral_types#update'









  # post "/dashboard", to: 'funerals#create', as: :funeral
  # get "/documents", to: 'funerals#documents', as: :funerals_documents
  # post "/documents", to: 'funerals#update_documents'

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

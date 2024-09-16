Rails.application.routes.draw do
  resources :authors
  resources :articles, only: [ :show, :index, :new, :create, :edit, :update ]
  # When you use resources, Rails automatically generates routes for the seven default actions that are commonly used in CRUD
  # index => list all
  # show => displays one specfic doc
  # new => form to create a new doc
  # create => handles form.submit to create a new doc
  # edit => displays edit form
  # update => handles form.submit to update
  # destroy => deletes an doc

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # root 'pages_controller#home_action'
  root "pages#home", as: "home" # root_path > home_path

  # /about
  get "about", to: "pages#about"
end

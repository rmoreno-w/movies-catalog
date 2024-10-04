Rails.application.routes.draw do
  resources :genres, only: [ :index, :show, :new, :create, :edit, :update ]
  resources :movie_directors, only: [ :index, :show, :new, :create, :edit, :update ]
  resources :movies, only: [ :index, :show, :new, :create, :edit, :update ]
  root  'home#index'
end

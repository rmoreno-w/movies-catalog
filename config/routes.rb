Rails.application.routes.draw do
  resources :genres, only: [ :index, :show, :new, :create, :edit, :update ]
end

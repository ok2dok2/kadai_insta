Rails.application.routes.draw do
  resources :photos
  resources :users, only: [:new, :create]
end

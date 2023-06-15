Rails.application.routes.draw do
  resources :photos
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :favorite]
  resources :users, only: [:show] do
    get :favorites, on: :member
  end
  resources :favorites, only: [:create, :destroy]
end

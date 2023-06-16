Rails.application.routes.draw do
  resources :photos do
    collection do
      post :confirm 
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :users, only: [:show] do
    get :favorites, on: :member
  end
  resources :favorites, only: [:create, :destroy]
end

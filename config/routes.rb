Rails.application.routes.draw do
  devise_for :users

  root  'photos#index'
  post   '/like/:photo_id', to: 'likes#create' , as: 'like'
  delete '/like/:photo_id', to: 'likes#destroy', as: 'unlike'

  resources :photos do
    resources :comments, only: [:create]
    collection do
      get 'post'
    end
  end
  resources :albums
  resources :users, only: [:show]
end
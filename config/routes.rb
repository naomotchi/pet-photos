Rails.application.routes.draw do
  devise_for :users
  root  'photos#index'

  resources :photos do
    resources :comments, only: [:create]
    collection do
      get 'post'
    end
  end

  resources :users, only: [:show]

end
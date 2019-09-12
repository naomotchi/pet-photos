Rails.application.routes.draw do
  devise_for :users
  root  'photos#index'

  resources :photos do
    collection do
      get 'post'
    end
  end
      get   'users/:id'   =>  'users#show' 
end
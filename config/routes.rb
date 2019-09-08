Rails.application.routes.draw do
  root  'photos#index'

  resources :photos do
    collection do
      get 'post'
    end
  end
end
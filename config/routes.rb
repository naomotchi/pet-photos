Rails.application.routes.draw do
  root  'photos#index'

  get 'photos' => 'photos#index'
end

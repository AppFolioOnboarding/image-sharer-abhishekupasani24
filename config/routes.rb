Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images
  root 'images#index'
  get 'images/tags/:tag', to: 'images#index', as: :tag
end

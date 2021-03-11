Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'articles', to: 'articles#index'
  resources :articles
  resources :comments, only: %i[create destroy]
end

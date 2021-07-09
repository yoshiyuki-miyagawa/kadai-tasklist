Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks
  resource :user, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'login', to: "sessions#destory"
end

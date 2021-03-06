Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


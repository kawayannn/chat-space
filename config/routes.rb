Rails.application.routes.draw do
<<<<<<< Updated upstream
  root to: 'messages#index'
=======
  devise_for :users
  root to: 'groups#index'
  resources :users,     only: [:edit, :update]
  resources :groups,    only: [:new, :edit, :create, :update]
  resources :messages,  only: [:index, :create]
  # resources :groups do
  # resources :messages 
  # end
>>>>>>> Stashed changes
end

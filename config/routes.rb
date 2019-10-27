Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  resources :users,  only: [:edit, :update]
<<<<<<< Updated upstream
  resources :groups, only: [:new, :edit, :create, :update]
=======
  resources :groups, only: [:new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
  validates :content, presence: true, unless: :image?

>>>>>>> Stashed changes
end

Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'
  devise_for :users
  devise_scope :user do
    resources :users, only: %i[show]
  end
end

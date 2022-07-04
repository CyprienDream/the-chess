Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  devise_scope :user do
    resources :users, only: %i[show]
  end

  resources :boards, only: %i[create show] do
    resources :moves, only: :create
  end
end

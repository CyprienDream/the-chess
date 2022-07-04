Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    resources :users, only: %i[show]
  end
end

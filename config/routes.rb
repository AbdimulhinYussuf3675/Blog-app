Rails.application.routes.draw do
  root "user#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end

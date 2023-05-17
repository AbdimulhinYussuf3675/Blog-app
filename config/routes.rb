Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end

  resources :posts, only: %i[index show new create destroy] do
    resources :comments, only: %i[new create destroy]
    resources :likes, only: :create
  end

  root 'users#index'
  delete '/users/:user_id/posts/:post_id', to: 'posts#destroy', as: 'delete_user_post'
  delete '/users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_user_post_comment'
end

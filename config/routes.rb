Rails.application.routes.draw do
  default_url_options :host => "example.com"
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index]
      end

      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end

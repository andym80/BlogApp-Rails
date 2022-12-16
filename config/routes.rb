# Rails.application.routes.draw do
#   root to: 'users#index'
#   devise_for :users

#   get '/users/', to: 'users#index'
#   get '/users/:id/', to: 'users#show'

#   get '/posts/new', to: 'posts#new'
#   get '/users/:id/posts/', to: 'posts#index'
#   get '/users/:id/posts/:id/', to: 'posts#show'

#   post '/posts', to: 'posts#create'
#   post '/users/:user_id/posts/:id/comments', to: 'comments#create'
#   post '/users/:user_id/posts/:id/likes', to: 'likes#create'
# end

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' } # rubocop:disable Layout/LineLength

  devise_scope :user do
    get '/sign_out', to: 'users/sessions#destroy'
  end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  root 'users#index'
end

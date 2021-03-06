Rails.application.routes.draw do
#  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'welcome#index'

  mount ActionCable.server, at: '/cable'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :lounges do
    resources :remarks
  end

  resources :dmessages

  get 'relationships/create'
  get 'relationships/destroy'
  get 'follow/add/:id', to: "follow#add"
  post 'follow/add/:id', to: "follow#add"
  get 'follow/remove/:id', to: "follow#remove"
  post 'follow/remove/:id', to: "follow#remove"
  get 'follow/block/:id', to: "follow#block"
  post 'follow/block/:id', to: "follow#block"
  get 'albums/image_urls/:id', to: "albums#image_urls"

  resources :watch_forums
  resources :bookmarks
  resources :agreements
  resources :albums
  resources :forum_categories
  resources :posts

  # devise_for :users
   devise_for :users, controllers: {
     sessions: 'users/sessions'
   }

#  devise_for :users

  # token auth routes available at /api/v1/auth

  devise_scope :user do
    get "/sign_in", :to => "users/sessions#new"
    get "/sign_out", :to => "users/sessions#destroy"
    get "/confirmation", :to => "users/confirmations#show"
  end

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  get 'users/following'
  get 'users/followers'

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  if Rails.env.development? #開発環境の場合
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  resources :user_infos
  resources :prefs
  resources :categories do
    resources :notes
  end
  resources :news
  resources :schedules
  resources :note_comments
  resources :notes do
    resources :pages
  end
  resources :pages do
    resources :page_comments
  end
  resources :forums do
    resources :forum_comments
  end
  resources :businesses
  resources :careers
  get '-/:id', to: "user_infos#show"
end

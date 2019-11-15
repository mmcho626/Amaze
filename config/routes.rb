Rails.application.routes.draw do

  root 'posts#index'

  devise_for :admins
  devise_for :users
  resources :items

  resources :posts do
  	  resources :comments, only:[:create]
  	  resources :favorites, only:[:create, :destroy]
  end

  resources :users, except:[:new, :create] do
    member do
      get :follower
      get :followed
    end
  end

  #ユーザ一覧用
  post 'follows/:id' => 'relationships#follows', as: "follows" # フォローする。follows_pathの作成。
  post 'unfollows/:id' => 'relationships#unfollows', as: "unfollows" # フォロー外す。unfollows_pathの作成。

  #ユーザ詳細用
  post 'follow/:id' => 'relationships#follow', as: "follow" # フォローする。follow_pathの作成。
  post 'unfollow/:id' => 'relationships#unfollow', as: "unfollow" # フォロー外す。unfollow_pathの作成。
end

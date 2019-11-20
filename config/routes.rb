Rails.application.routes.draw do


  #管理者側　ここから



  #管理者用のdevise
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  }

  namespace :admins do

    resources :users, expect:[:new, :create] do

      get :follower
      get :followed

      get :favorites

    end


    resources :posts do

      resources :comment, only:[:create, :destroy]
      resources :favorites, only:[:create, :destroy]

      member do
        get :favorites
      end

    end

    resources :items

  end

  #管理者側　ここまで



  #ユーザ用のdevise
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }


  root 'posts#index'


  resources :items

  resources :posts do
    resources :comments, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]

    member do
      get :favorites
    end
  end

  resources :users, except:[:new, :create] do
    member do
      get :follower
      get :followed

      get :favorites
    end
  end

  #ユーザ一覧用
  post 'follows/:id' => 'relationships#follows', as: "follows" # フォローする。follows_pathの作成。
  post 'unfollows/:id' => 'relationships#unfollows', as: "unfollows" # フォロー外す。unfollows_pathの作成。

  #ユーザ詳細用
  post 'follow/:id' => 'relationships#follow', as: "follow" # フォローする。follow_pathの作成。
  post 'unfollow/:id' => 'relationships#unfollow', as: "unfollow" # フォロー外す。unfollow_pathの作成。

  get "search" => "users#search"

end

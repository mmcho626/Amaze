Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :items

  resources :posts do
  	  resources :comments, only:[:create]
  	  resources :favorites, only:[:create, :destroy]
  end

  resources :users, except:[:new, :create] #deviseを使っているため
end

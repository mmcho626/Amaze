Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :items
  resources :posts
  resources :users, except:[:new, :create] #deviseを使っているため
  resources :comments, only:[:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

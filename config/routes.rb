Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :items

  resources :posts do
  	  resources :comments, only:[:create]
  end

  resources :users, except:[:new, :create] #deviseを使っているため

  resources :favorites, only:[:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

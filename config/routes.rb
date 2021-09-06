Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to:"homes#top"

  resources :post_images,only:[:new,:create,:index,:destroy,:show] do
   resources :post_images,only:[:create,:destroy]
   resource :favorites,only:[:create,:destroy]
 end

  resources :user,only:[:show,:edit,:update]
end

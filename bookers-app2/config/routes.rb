Rails.application.routes.draw do
  # get 'homes/top' =>'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'about' => 'homes#about'  
  resources :users, only:[:index,:create,:show,:edit,:update,:destroy]
  #resources :books, only:[:index,:show,:create,:edit,:destroy]
  resources :books
end

Rails.application.routes.draw do
  devise_for :users


  #devise_for :users
  resources :articles,{only: [:show]} do
    resources :posts

  end

  get '/index'=>"home#top"
  root "home#main"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

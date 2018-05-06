Rails.application.routes.draw do


  get 'posts2/create'

  get 'posts2/destroy'

  # get 'posts2/edit'

  # get 'posts2/update'

  devise_for :users


  #devise_for :users
  resources :articles,{only: [:show]} do
    resources :posts,{only:[:create,:delete]}

  end
  resources :articles2,{only: [:show]} do
    resources :posts2,{only:[:create,:delete]}
  end

  get '/index'=>"home#top"
  root "home#main"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  
  resources :topics do
    resources :posts do
      resources :comments
      resources :tags
      resources :ratings
    end
    post "/posts/:post_id/read/:user_id", to: "posts#read"
    resources :tags
  end

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "topics#index"
end

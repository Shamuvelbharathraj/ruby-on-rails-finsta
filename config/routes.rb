Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "/user_profile", to: "profiles#show"
  
  resources :topics do
    resources :posts do
      resources :comments do
        resources :commentsratings
      end
      resources :tags
      resources :ratings
    end
    post "/posts/:post_id/read/:user_id", to: "posts#read"
    resources :tags
  end

  resources :posts
  post "/posts/filter", to: "posts#filter"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "topics#index"
end

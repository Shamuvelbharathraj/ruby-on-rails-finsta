Rails.application.routes.draw do
  
  resources :topics do
    resources :posts do
      resources :comments
      resources :tags
      resources :ratings
    end
    resources :tags
  end

  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "topics#index"
end

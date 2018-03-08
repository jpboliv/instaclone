Rails.application.routes.draw do
  devise_for :users
  resources :posts  do
    resources :comments
    member do
      put "like", to: "posts#like"
      put "unlike", to: "posts#unlike"
    end
  end
  
  root "posts#index"
end

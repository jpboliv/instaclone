Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  
  resources :posts  do
    member do
      put "like" => "posts#vote"
    end
    resources :comments
  end

end

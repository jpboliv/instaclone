Rails.application.routes.draw do
    devise_for :users
    root "posts#index"
    
    resources :posts  do
        member do
        put "like" => "posts#vote"
        end
        resources :comments
    end

    get ':user_name', to: 'profiles#show', as: :profile
    get ':user_name/edit', to:'profiles#edit', as: :edit_profile
    patch ':user_name/edit', to:'profiles#update', as: :update_profile
end

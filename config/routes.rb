Rails.application.routes.draw do 
    get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
    get 'notifications', to: "notifications#index"
    get 'profiles/show'
    devise_for :users

    get 'posts', to: 'posts#index'
    get 'show', to: 'posts#index'
    
    root "posts#index"

    get ':user_name', to: 'profiles#show', as: :profile
    get ':user_name/edit', to:'profiles#edit', as: :edit_profile
    patch ':user_name/edit', to:'profiles#update', as: :update_profile
    
    resources :posts  do
        member do
        put "like" => "posts#vote"
        end
        resources :comments
    end

end

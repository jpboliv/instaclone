Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'
  get 'profiles/show'
  devise_for :users

  get 'posts', to: 'posts#index'
  get 'show', to: 'posts#index'

  get 'search', to: 'posts#search'
  root 'posts#index'

  get 'user/:user_name', to: 'profiles#show', as: :profile
  get 'user/:user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch 'user/:user_name/edit', to: 'profiles#update', as: :update_profile

  get 'user/:user_name/update_posts_order', to: 'profiles#update_posts_order', as: :order_posts

  resources :posts do
    get 'update_likes', on: :collection
    
    member do
      get 'like'
      get 'unlike'
    end
    resources :comments 
  end
end

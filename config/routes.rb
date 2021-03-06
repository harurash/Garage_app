Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, only: [:index,:new,:create,:destroy,:show] do
    resource :favorites,only:[ :create, :destroy]
    resources :images,only: [:create]
    resources :comments, only: [:create]
    collection do
      get "search"
    end
  end
  resources :users
end

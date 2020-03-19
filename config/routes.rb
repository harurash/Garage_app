Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, only: [:index,:new,:create,:destroy,:show] do
    resource :favorites,only:[ :create, :destroy]
    resources :images,only: [:create]
    collection do
      get "search"
    end
  end
  resources :users
end

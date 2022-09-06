Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'groups#index'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :groups, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end
end

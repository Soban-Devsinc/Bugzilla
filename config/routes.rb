Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :bugs
  resources :users

  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'bugs/assign_bugs', to: 'bug#show'
end

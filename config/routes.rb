require 'constraints/domain_constraint'
Rails.application.routes.draw do
  get "products/index"
  get "products/show"
  get "products/new"
  get "products/edit"
  get "accounts/index"
  get "dashboards/show"
  devise_for :users

  post '/webhooks/:source', to: 'webhooks#create'
  constraints DomainConstraint do
    scope module: :stores do
      resources :products
      root to: 'products#index', as: 'store_root'
    end
  end

  root "static_pages#root"

  resource :dashboard
  resources :accounts
  resources :payouts
  resource :store
  resources :checkout
  resources :products do
   resources :attachments, only: [:create]
  
  end
end

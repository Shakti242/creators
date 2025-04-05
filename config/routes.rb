require 'constraints/domain_constraint'

Rails.application.routes.draw do
  get "cards/new"
  get "cardholders/index"
  get "cardholders/new"
  devise_for :users
  post '/webhooks/:source', to: 'webhooks#create'
  namespace :public do
    namespace :v1 do
      get 'hello', to: 'public#hello'
    end
  end
  constraints DomainConstraint do
    scope module: :stores do
      resources :products
      root to: 'products#index', as: 'store_root'
      resource :checkout, as: 'store_checkout'
      resources :logins
      resources :orders
      resources :attachments
    end
  end

  root 'static_pages#root'

  resource :dashboard
  resources :accounts
  resources :payouts, only: [:create]

  resources :products do
    resources :attachments, shallow: true
  end

  resource :store

  resource :checkout
  resources :customers
  resources :cardholders do
    resources :cards, shallow: true do
      resource :ephemeral_key, only: [:show]
    end
  end
end

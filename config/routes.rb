Rails.application.routes.draw do
  get "products/index"
  get "products/show"
  get "products/new"
  get "products/edit"
  get "accounts/index"
  get "dashboards/show"
  devise_for :users
  root "static_pages#root"

  post '/webhooks/:source', to: 'webhooks#create'
  resource :dashboard
  resources :accounts
  resources :payouts
  resources :products do
    resources :attachments, only: [:create]
  end
end

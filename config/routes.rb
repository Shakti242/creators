Rails.application.routes.draw do
  get "accounts/index"
  get "dashboards/show"
  devise_for :users
  root "static_pages#root"

  post '/webhooks/:source', to: 'webhooks#create'
  resource :dashboard
  resources :accounts

end

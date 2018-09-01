Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'overrides/sessions',
  }

  resources :users,         only: [:index, :show,   :update, :destroy],           defaults: { format: :json }
  resources :events,        only: [:index, :create, :show, :update, :destroy],    defaults: { format: :json }
  resources :reservations,  only: [:index, :create, :update, :destroy],           defaults: { format: :json }
  
  namespace :pictures, defaults: { format: :json } do
    get  'show'
    post 'upload'
    post 'delete'
  end
end

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'overrides/sessions'
    #omniauth_callbacks: 'overrides/omniauth_callbacks'
  }

  namespace :api, defaults: { format: :json } do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          omniauth_callbacks: 'api/v1/auth/omniauth_callbacks'
      }
    end
  end

  resources :users,         only: [:index, :show,   :update, :destroy],           defaults: { format: :json }
  resources :events,        only: [:index, :create, :show, :update, :destroy],    defaults: { format: :json }
  resources :reservations,  only: [:index, :create, :update, :destroy],           defaults: { format: :json }
  
  namespace :pictures, defaults: { format: :json } do
    get  'show'
    put  'update'
    post 'upload'
    post 'delete'
  end

  namespace :utils, defaults: { format: :json } do
    post 'release_email'
  end
end

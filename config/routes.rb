Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'overrides/sessions',
  }

  resources :users,  only: [:index, :show, :update, :destroy], defaults: { format: :json }
  resources :events, only: [:index, :show, :update, :destroy], defaults: { format: :json }
end

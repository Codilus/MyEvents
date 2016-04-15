Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :client do
    namespace :api, defaults: { format: 'json' } do
      resources :events, only: [:index, :create, :update, :show]
      resources :billing, only: [:index]
    end
  end

  namespace :promoter do
    namespace :api, defaults: { format: 'json' } do
      resources :billing, only: [:index]
    end
  end

end

Rails.application.routes.draw do
  mount_devise_token_auth_for 'Client', at: 'clients/auth'

  resources :offers, only: [:index, :show, :create, :update] do
    put :update_budget, on: :member
  end

end

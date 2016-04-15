Rails.application.routes.draw do
  mount_devise_token_auth_for 'Client', at: 'clients/auth'

  resources :offers, only: [:index, :show, :create] do
    member do
      put :update_budget
      get :accept_budget
      get :refuse_budget
    end
    put :update_budget, on: :member
  end

end

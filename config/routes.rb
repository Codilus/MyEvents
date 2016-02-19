Rails.application.routes.draw do
  mount_devise_token_auth_for 'Client', at: 'clients/auth'

end

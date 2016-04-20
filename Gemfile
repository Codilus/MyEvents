source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.5.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

gem 'devise'
gem 'devise_token_auth'
gem 'rack-cors', :require => 'rack/cors'
gem "http"

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

gem 'foreman'
group :production, :staging do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end

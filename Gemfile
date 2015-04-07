source 'https://rubygems.org'

ruby '2.2.1'
gem 'rails', '4.2.1'
gem 'passenger' # Web Server
gem 'pg' # Postgres Database     

gem 'bcrypt' # Encryption
gem 'bootstrap-sass' # Front End Framework
gem 'coffee-rails', '~> 4.1.0'
gem 'devise' # Authentication
gem 'haml-rails' # HTML Preprocessor
gem 'hirb' # Pretty console
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'responders' # Clean controllers
gem 'sass-rails', '~> 5.0'
gem 'simple_form' # Form generator
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'pry' # Code debugger
  gem 'spring' # Fast Application loading
  gem 'spring-commands-cucumber' # Spring for Cucumber
  gem 'spring-commands-rspec'    # Spring for RSpec
end

group :development do
  gem 'annotate'
  gem 'better_errors' # Better Ruby errors
  gem 'byebug'
  gem 'quiet_assets' # Mute assets in Rails server
end

group :test do
  gem 'capybara'                       # Simulate user
  gem 'poltergeist'                    # Simulate browser JS
  gem 'cucumber-rails', require: false # Acceptance tests
  gem 'database_cleaner'               # Clean test db
  gem 'factory_girl_rails'             # Factories for tests
  gem 'faker'                          # Fake data
  gem 'guard'                          # Watch project directory
  gem 'guard-livereload'               # Reload page on save
  gem 'guard-cucumber'                 # Run features on save
  gem 'guard-rspec'                    # Run specs on save
  gem 'launchy'                        # Launch browser on test failure
  gem 'rspec-rails'                    # Functional tests
  gem 'simplecov'                      # See test coverage
end

group :production do
  gem 'heroku-deflater' # Gzip static files
  gem 'rails_12factor' # Heroku plugins
end

gem 'sdoc', '~> 0.4.0', group: :doc
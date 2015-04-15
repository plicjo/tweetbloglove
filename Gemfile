source 'https://rubygems.org'

ruby '2.2.1'
gem 'rails', '4.2.1'
gem 'passenger' # Web Server
gem 'pg' # Postgres Database

gem 'bcrypt' # Encryption
gem 'bootstrap-sass' # Front End Framework
gem 'carrierwave' # File Uploads
gem 'coffee-rails', '~> 4.1.0'
gem 'figaro' # Environment Variables
gem 'haml-rails' # HTML Preprocessor
gem 'hirb' # Pretty console
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'omniauth-twitter' # Twitter Authentication
gem 'pygments.rb' # Syntax Highlighting
gem 'pundit' # Authorization
gem 'redcarpet' # Markdown text
gem 'responders' # Clean controllers
gem 'sass-rails', '~> 5.0'
gem 'simple_form' # Form generator
gem 'turbolinks'
gem 'twitter' # Twitter API
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate' # Pagination
gem 'will_paginate-bootstrap' # Bootstrap styles for pagination

group :development, :test do
  gem 'pry' # Code debugger
  gem 'spring' # Fast Application loading
  gem 'spring-commands-cucumber' # Spring for Cucumber
  gem 'spring-commands-rspec'    # Spring for RSpec
  gem 'faker'                    # Fake data
end

group :development do
  gem 'annotate'
  gem 'better_errors' # Better Ruby errors
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'quiet_assets' # Mute assets in Rails server
end

group :test do
  gem 'capybara'                       # Simulate user
  gem 'poltergeist'                    # Simulate browser JS
  gem 'cucumber-rails', require: false # Acceptance tests
  gem 'database_cleaner'               # Clean test db
  gem 'factory_girl_rails'             # Factories for tests
  gem 'guard'                          # Watch project directory
  gem 'guard-livereload'               # Reload page on save
  gem 'guard-cucumber'                 # Run features on save
  gem 'guard-rspec'                    # Run specs on save
  gem 'launchy'                        # Launch browser on test failure
  gem 'rspec-rails'                    # Functional tests
  gem 'simplecov'                      # See test coverage
  gem 'shoulda-matchers'               # Quick test writing
  gem 'shoulda-callback-matchers', '~> 1.1.1' # Rspec callback matchers
  gem 'webmock'                        # Fake HTTP Requests
end

group :production do
  gem 'heroku-deflater' # Gzip static files
  gem 'rails_12factor' # Heroku plugins
end

gem 'sdoc', '~> 0.4.0', group: :doc

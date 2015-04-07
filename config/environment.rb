# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the Hirb gem
require 'hirb'
Hirb::View.enable

# Initialize the Rails application.
Rails.application.initialize!

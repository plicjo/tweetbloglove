# Load test helper methods
require "#{Rails.root}/spec/support/test_helper.rb"
include TestHelper

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:twitter] = twitter_auth_hash
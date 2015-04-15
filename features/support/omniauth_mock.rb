# Load test helper methods
require "#{Rails.root}/spec/support/test_helper.rb"
include TestHelper

OmniAuth.config.test_mode = true
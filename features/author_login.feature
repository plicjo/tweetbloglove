Feature: Author Login
  Author can sign in, and sign out of the blog with Twitter

  Scenario: Author signs in
    Given the author is on the home page
    When  the author signs in with Twitter
    Then  the author should see "Signed in successfully."
  
  # Scenario: Author signs out
  #   Given an author is logged in
  #   Given an author is on the posts page
  #   When  the author clicks "Sign Out"
  #   Then  the author should see "Signed out successfully."

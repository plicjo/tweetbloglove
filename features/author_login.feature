Feature: Author Login
  Author can sign up, sign in, and sign out of the blog

  Scenario: Author signs up
    Given a visitor is on the sign up page
    When  the visitor signs up to be an author
    Then  the visitor should see "Welcome! You have signed up successfully."

  Scenario: Author signs in
    Given an author has already signed up
    Given the author is on the sign in page
    When  the author signs in
    Then  the author should see "Signed in successfully."
  
  Scenario: Author signs out
    Given an author has already signed up
    Given an author is on the posts page
    When  the author clicks "Sign Out"
    Then  the author should see "Signed out successfully."
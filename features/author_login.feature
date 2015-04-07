Feature: Author Login
  Author can sign up, sign in, and sign out of the blog

  Scenario: Author signs up
    Given a visitor is on the sign up page
    When  the visitor signs up to be an author
    Then  the visitor should see "Welcome! You have signed up successfully."
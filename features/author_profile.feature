Feature: Author Profile
  Authors can change their default time zone

  Scenario: Author changes their default time zone
    Given the author is logged in
    When I click "Edit Profile"
    Then I should see "Edit Author Profile"
    When I change my time zone and submit the form
    Then I should see "Author was successfully updated."

Feature: Publishing
  Authors can publish posts immediately or at a specific time and date.

  Scenario: Author published a post at a later date
    Given an author has created a post
    Given the author is logged in
    When  the author clicks "Edit"
    Then  the author should see "Edit Post"
    When  the author publishes the post later
    Then  the author should see "Post was successfully updated."
    And   the post should be queued up to be published
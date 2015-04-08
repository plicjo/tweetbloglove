Feature: Posts
  Authors can create, edit, delete, and publish posts to the blog.

  Scenario: Author creates a post
    Given an author is logged in
    And   is on the new post page
    When  I write a post using Markdown
    And   I upload an image
    And   I click "Create Post"
    Then  the author should see "Post was successfully created."
    And   the author should see the featured image
    And   the author should not see any markdown
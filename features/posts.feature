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

  Scenario: Visitor tries to create a post
    Given a visitor is not signed in
    And   tries to visit the new post page
    Then  I should see "Please sign in first."

  Scenario: Author edits a post
    Given an author has created a post
    Given the author is logged in
    When  the author clicks "Edit"
    Then  the author should see "Edit Post"
    When  the author submits a valid edit post form
    Then  the author should see "Post was successfully updated."

  Scenario: Author views a post
    Given an author has created a post
    Given the author is logged in
    When  the author clicks "View"
    Then  the author should see the post

  Scenario: Author deletes a post
    Given an author has created a post
    Given the author is logged in
    When  the author clicks "Delete"
    Then  the author should see "Post was successfully destroyed."
  
  Scenario: Author is unable to edit the tweet message on the edit page
    Given an author has created a post
    Given the author is logged in
    When  the author clicks "Edit"
    Then  the author should see "Edit Post"
    Then  the twitter message input should be disabled
 

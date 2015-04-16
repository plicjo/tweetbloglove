Feature: Authorizations
  Visitors and authors have permissions on what they can see and do.

  Scenario: An author sees no link to edit another author's published post
    Given an author has created a post and published it
    Given another author "John" is logged in
    Then  the other author "John" should not see links to edit the original authors post

  Scenario: An author does not see another author's unpublished post
    Given an author has created a post
    Given another author "John" is logged in
    Then  the other author "John" should not see the original post

  Scenario: An author has no access to edit another author's post
    Given an author has created a post and published it
    Given another author "John" is logged in
    Then  the other author "John" should not see links to edit the original authors post
    When  he tries to edit the post anyway
    Then  he should see "You cannot edit this post!"


# TweetBlogLove

TweetBlogLove is a blogging platform that notifies twitter with each new blog post.

## Dependencies ##

* RVM
* Ruby version 2.2.1
* Rails version 4.2.1

* Template Engine: Haml
* Database: Postgres
* Testing: RSpec | Cucumber
* Front-End: Bootstrap | jQuery

* Authentication: Omniauth-Twitter
* Form Builder: Simple Form

##Getting Started##
1. Clone the project down to your machine with RVM installed.
2. `cd` into the project.
3. Run `bundle install`.
4. `rails s` and go nuts.

##Testing##
* Acceptance Testing: Cucumber
* Unit Testing: RSpec
* Object Creation: Factory Girl
* Fake Data: Faker

Tests that require Javascript are run with the `poltergeist` gem.

##Deploying##

Commits to the ***master*** branch run tests on [CircleCI](www.circleci.com) and deploys to the [live site](tweetbloglove.herokuapp.com) if all the tests pass.


##Credits##
Author: [Joshua Plicque](mailto:plicjo@gmail.com)

If you have any questions, send me an email.
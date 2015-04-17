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
1. Install Redis (For background queueing) with `brew install redis`
2. Clone the project down to your machine with RVM installed.
3. `cd` into the project.
4. Run `bundle install`.
5. Start up the sidekiq server to process posts being published later. `bundle exec sidekiq`
6. `rails s` and go nuts.

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
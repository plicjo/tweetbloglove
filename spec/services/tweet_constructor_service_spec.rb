require 'rails_helper'

describe TweetConstructorService do

  before :each do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  end

  let!(:post) { create :post_with_author }
  let!(:post_with_long_title) { create :post_with_long_title }
  let(:tweet_constructor) { TweetConstructorService.new(post) }
  let(:long_tweet_constructor){ TweetConstructorService.new(post_with_long_title) }

  context '#tweet' do
    it "returns an href" do
      expect(tweet_constructor.tweet).to include 'http://'
    end

    it "generates a normal tweet" do
      expect(tweet_constructor.tweet).to be_a String
      expect(tweet_constructor.tweet.length).to be < 140
    end

    it "truncates a tweet that would be greater than 140 characters" do
      expect(long_tweet_constructor.tweet.length).to be < 140
    end

    it "includes the twitter_message if it was provided" do
      post.twitter_message = "foo"
      expect(tweet_constructor.tweet).to include "foo"
    end

    it "includes the post.title if twitter_message is empty" do
      post.twitter_message = " "
      expect(tweet_constructor.tweet).to include post.title
    end

  end
  
end
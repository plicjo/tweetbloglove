require 'rails_helper'

describe TweetConstructorService do

  before :each do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  end

  let(:post) { create :post_with_author          }
  let(:tweet) { TweetConstructorService.new(post) }


  it "initializes with a post link" do
    expect(tweet.link).to include 'http://'
  end

  it "initializes @content with twitter_message" do
    post.twitter_message = "foo"
    expect(tweet.content).to include "foo"
  end

  it "initializes @content with post.title if no twitter_message is specified" do
    expect(tweet.content).to include post.title
  end

  context "#generate_tweet" do

    let(:post_with_long_title) { create :post_with_long_title }
    let(:long_tweet){ TweetConstructorService.new(post_with_long_title) }
    
    it "generates a tweet less than or equal to 140 characters" do
      expect(tweet.generate_tweet.length).to be < 140
    end

    it "truncates a tweet that would be greater than 140 characters" do
      expect(long_tweet.generate_tweet.length).to be < 140
    end
  
  end
  
end
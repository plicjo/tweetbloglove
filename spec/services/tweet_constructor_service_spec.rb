require 'rails_helper'

describe TweetConstructorService do

  let!(:post) { create :post_with_author          }
  let(:tweet) { TweetConstructorService.new(post) }

  it "it initializes with a post link" do
    expect(tweet.link).to include 'http://'
  end

  it "it initializes with post content" do
    expect(tweet.content).to include post.title
  end

  context "#generate_tweet" do

    let!(:post_with_long_title) { create :post_with_long_title }
    let(:long_tweet){ TweetConstructorService.new(post_with_long_title) }
    
    it "generates a tweet less than or equal to 140 characters" do
      expect(tweet.generate_tweet.length).to be < 140
    end

    it "truncates a tweet that would be greater than 140 characters" do
      expect(long_tweet.generate_tweet.length).to be < 140
    end
  
  end
  
end
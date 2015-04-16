# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  title           :string
#  body            :text
#  featured_image  :string
#  author_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  twitter_message :string
#  published       :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Post, type: :model do

  before :each do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  end

  it { should belong_to(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author_id) }
  it { should validate_length_of(:twitter_message) }
  it { should allow_value(nil).for(:twitter_message) }
  it { is_expected.to callback(:post_to_twitter).after(:create) }
  it { is_expected.to_not callback(:post_to_twitter).before(:update) }
  
  it "validates the presence of featured_image" do
    post = Post.create
    expect(post.errors[:featured_image]).to include('needs to be uploaded.')
  end

  context ".published_or_authored" do
    let!(:unpublished_post){ create :post_with_author }
    let!(:published_post)  {   create :published_post }
    let(:unpublished_post_author) { unpublished_post.author }

    it "returns published posts" do
      expect(Post.published_or_authored(nil)).to include published_post
    end

    it "unpublished posts with no passed in author are not returned" do
      expect(Post.published_or_authored(nil)).not_to include unpublished_post
    end

    it "returns unpublished posts that belong to the logged-in author" do
      expect(Post.published_or_authored(unpublished_post_author)).to include unpublished_post
    end

    it "returns one record if the post is published and belongs to the logged-in author" do
      post_collection = Post.published_or_authored(published_post.author)
      expect(post_collection.count).to eq 1
    end

  end

end

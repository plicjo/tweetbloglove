# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string
#  body           :text
#  featured_image :string
#  author_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author_id) }
  it { is_expected.to callback(:post_to_twitter).after(:create) }
  it { is_expected.to_not callback(:post_to_twitter).before(:update) }

  let(:post) { Post.create }
  
  it "validates the presence of featured_image" do
    expect(post.errors[:featured_image]).to include('needs to be uploaded.')
  end

end

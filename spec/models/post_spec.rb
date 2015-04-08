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
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:author) }
  
  it "validates the presence of featured_image" do
    post = Post.create
    expect(post.errors[:featured_image]).to include('needs to be uploaded.')
  end
end

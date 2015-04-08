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

class Post < ActiveRecord::Base
  belongs_to :author
  mount_uploader :featured_image, FeaturedImageUploader

  validates :title, :body, presence: true
  validates_presence_of :featured_image, message: 'needs to be uploaded.'
end

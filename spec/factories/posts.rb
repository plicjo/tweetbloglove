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

FactoryGirl.define do
  factory :post do
    title Faker::Name.name
    body  Faker::Lorem.paragraph(3)
    featured_image File.new("#{Rails.root}/spec/support/featured_image.jpg")
    
    factory :post_with_author do
      author
    end
  end

  factory :post_with_long_title, class: Post do
    title 'a' * 200
    body  Faker::Lorem.paragraph(3)
    featured_image File.new("#{Rails.root}/spec/support/featured_image.jpg")
    author
  end

end

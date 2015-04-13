FactoryGirl.define do
  factory :post do
    title Faker::Name.name
    body  Faker::Lorem.paragraph(3)
    featured_image File.new("#{Rails.root}/spec/support/featured_image.jpg")
    
    factory :post_with_author do
      author
    end
  end

end

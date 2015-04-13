FactoryGirl.define do
  factory :post do
    title Faker::Name.name
    body  Faker::Lorem.paragraph(3)
    author
  end
end

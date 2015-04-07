FactoryGirl.define do
  factory :author do
    email Faker::Internet.email
    password              'password'
    password_confirmation 'password'
  end

end

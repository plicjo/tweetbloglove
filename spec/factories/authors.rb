# == Schema Information
#
# Table name: authors
#
#  id            :integer          not null, primary key
#  provider      :string
#  uid           :string
#  name          :string
#  token         :string
#  secret        :string
#  profile_image :string
#  created_at    :datetime
#  updated_at    :datetime
#

FactoryGirl.define do
  factory :author do
    email Faker::Internet.email
    password              'password'
    password_confirmation 'password'
  end

end

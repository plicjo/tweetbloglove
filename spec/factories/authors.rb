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
#  time_zone     :string           default("Eastern Time (US & Canada)")
#

FactoryGirl.define do
  factory :author do
    name Faker::Name.name
  end

  factory :another_author, class: Author do
    name "John"
  end

end

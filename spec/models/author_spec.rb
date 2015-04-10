# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe Author, type: :model do

  let(:find_or_create_author) { Author.find_or_create_from_auth_hash(auth_hash) }
  let(:auth_hash) { twitter_auth_hash }
  
  it { should have_many(:posts) }

  describe '.find_or_create_from_auth_hash' do
    
    it 'creates a user when none exists' do
      expect{ find_or_create_author }.to change(Author, :count).by 1
    end

    it "updates an existing user's attributes" do
      Author.create(:provider => "twitter", :uid => "123456")
      expect{ find_or_create_author }.to change(Author, :count).by 0
    end
  end

  describe '#twitter' do
    it 'initializes a new twitter client' do
      expect(find_or_create_author.twitter).not_to be(nil)
    end
  end
end

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

class Author < ActiveRecord::Base
  has_many :posts

  def self.find_or_create_from_auth_hash(auth_hash)
    author = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    author.update(
      name:          auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token:         auth_hash.credentials.token,
      secret:        auth_hash.credentials.secret
    )
    author
  end
end

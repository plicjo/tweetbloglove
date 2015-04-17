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

class Author < ActiveRecord::Base
  has_many :posts
  validates :time_zone, inclusion: { in: ActiveSupport::TimeZone.zones_map(&:name).keys }
  after_initialize :init_time_zone

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

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_api_secret"]
      config.access_token        = self.token
      config.access_token_secret = self.secret
    end
  end

  private

    def init_time_zone
      self.time_zone ||= 'Eastern Time (US & Canada)'
    end
end

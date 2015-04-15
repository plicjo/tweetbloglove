module TestHelper
  def twitter_oauth_response
    {
      :provider => "twitter",
      :uid => "123456",
      :info => {
        :nickname => "johnqpublic",
        :name => "John Q Public",
        :location => "Anytown, USA",
        :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
        :description => "a very normal guy.",
        :urls => {
          :Website => nil,
          :Twitter => "https://twitter.com/johnqpublic"
        }
      },
      :credentials => {
        :token => "a1b2c3d4...", # The OAuth 2.0 access token
        :secret => "abcdef1234"
      },
      :extra => {
        :access_token => "", # An OAuth::AccessToken object
        :raw_info => {
          :name => "John Q Public",
          :listed_count => 0,
          :profile_sidebar_border_color => "181A1E",
          :url => nil,
          :lang => "en",
          :statuses_count => 129,
          :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
          :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
          :location => "Anytown, USA",
          :time_zone => "Chicago",
          :follow_request_sent => false,
          :id => 123456,
          :profile_background_tile => true,
          :profile_sidebar_fill_color => "666666",
          :followers_count => 1,
          :default_profile_image => false,
          :screen_name => "",
          :following => false,
          :utc_offset => -3600,
          :verified => false,
          :favourites_count => 0,
          :profile_background_color => "1A1B1F",
          :is_translator => false,
          :friends_count => 1,
          :notifications => false,
          :geo_enabled => true,
          :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
          :protected => false,
          :description => "a very normal guy.",
          :profile_link_color => "2FC2EF",
          :created_at => "Thu Jul 4 00:00:00 +0000 2013",
          :id_str => "123456",
          :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
          :default_profile => false,
          :profile_use_background_image => false,
          :entities => {
            :description => {
              :urls => []
            }
          },
          :profile_text_color => "666666",
          :contributors_enabled => false
        }
      }
    }
  end

  def twitter_oauth_response_for_another_author
    {
          :provider => "twitter",
          :uid => "909090",
          :info => {
            :nickname => "johnqpublic",
            :name => "John Q Public",
            :location => "Anytown, USA",
            :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
            :description => "a very normal guy.",
            :urls => {
              :Website => nil,
              :Twitter => "https://twitter.com/johnqpublic"
            }
          },
          :credentials => {
            :token => "a1b2c3d4...", # The OAuth 2.0 access token
            :secret => "abcdef1234"
          },
          :extra => {
            :access_token => "", # An OAuth::AccessToken object
            :raw_info => {
              :name => "John Q Public",
              :listed_count => 0,
              :profile_sidebar_border_color => "181A1E",
              :url => nil,
              :lang => "en",
              :statuses_count => 129,
              :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
              :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
              :location => "Anytown, USA",
              :time_zone => "Chicago",
              :follow_request_sent => false,
              :id => 123456,
              :profile_background_tile => true,
              :profile_sidebar_fill_color => "666666",
              :followers_count => 1,
              :default_profile_image => false,
              :screen_name => "",
              :following => false,
              :utc_offset => -3600,
              :verified => false,
              :favourites_count => 0,
              :profile_background_color => "1A1B1F",
              :is_translator => false,
              :friends_count => 1,
              :notifications => false,
              :geo_enabled => true,
              :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
              :protected => false,
              :description => "a very normal guy.",
              :profile_link_color => "2FC2EF",
              :created_at => "Thu Jul 4 00:00:00 +0000 2013",
              :id_str => "123456",
              :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
              :default_profile => false,
              :profile_use_background_image => false,
              :entities => {
                :description => {
                  :urls => []
                }
              },
              :profile_text_color => "666666",
              :contributors_enabled => false
            }
          }
        }
  end

  def twitter_auth_hash
    OmniAuth::AuthHash.new(twitter_oauth_response)
  end

  def twitter_auth_hash_for_another_author
    OmniAuth::AuthHash.new(twitter_oauth_response_for_another_author)
  end

  def twitter_status_update_response
    {
      "coordinates": nil,
      "favorited": false,
      "created_at": "Wed Sep 05 00:37:15 +0000 2012",
      "truncated": false,
      "id_str": "243145735212777472",
      "entities": {
        "urls": [
     
        ],
        "hashtags": [
          {
            "text": "peterfalk",
            "indices": [
              35,
              45
            ]
          }
        ],
        "user_mentions": [
     
        ]
      },
      "in_reply_to_user_id_str": nil,
      "text": "Maybe he'll finally find his keys. #peterfalk",
      "contributors": nil,
      "retweet_count": 0,
      "id": 243145735212777472,
      "in_reply_to_status_id_str": nil,
      "geo": nil,
      "retweeted": false,
      "in_reply_to_user_id": nil,
      "place": nil,
      "user": {
        "name": "Jason Costa",
        "profile_sidebar_border_color": "86A4A6",
        "profile_sidebar_fill_color": "A0C5C7",
        "profile_background_tile": false,
        "profile_image_url": "http://a0.twimg.com/profile_images/1751674923/new_york_beard_normal.jpg",
        "created_at": "Wed May 28 00:20:15 +0000 2008",
        "location": "",
        "is_translator": true,
        "follow_request_sent": false,
        "id_str": "14927800",
        "profile_link_color": "FF3300",
        "entities": {
          "url": {
            "urls": [
              {
                "expanded_url": "http://www.jason-costa.blogspot.com/",
                "url": "http://t.co/YCA3ZKY",
                "indices": [
                  0,
                  19
                ],
                "display_url": "jason-costa.blogspot.com"
              }
            ]
          },
          "description": {
            "urls": [
     
            ]
          }
        },
        "default_profile": false,
        "contributors_enabled": false,
        "url": "http://t.co/YCA3ZKY",
        "favourites_count": 883,
        "utc_offset": -28800,
        "id": 14927800,
        "profile_image_url_https": "https://si0.twimg.com/profile_images/1751674923/new_york_beard_normal.jpg",
        "profile_use_background_image": true,
        "listed_count": 150,
        "profile_text_color": "333333",
        "protected": false,
        "lang": "en",
        "followers_count": 8760,
        "time_zone": "Pacific Time (US & Canada)",
        "profile_background_image_url_https": "https://si0.twimg.com/images/themes/theme6/bg.gif",
        "verified": false,
        "profile_background_color": "709397",
        "notifications": false,
        "description": "Platform at Twitter",
        "geo_enabled": true,
        "statuses_count": 5532,
        "default_profile_image": false,
        "friends_count": 166,
        "profile_background_image_url": "http://a0.twimg.com/images/themes/theme6/bg.gif",
        "show_all_inline_media": true,
        "screen_name": "jasoncosta",
        "following": false
      },
      # "source": "<a href="//jason-costa.blogspot.com\"" rel="''\"''nofollow''\"''">My Shiny App</a>",
      # "in_reply_to_screen_name": nil,
      # "in_reply_to_status_id": nil
    }
  end
end
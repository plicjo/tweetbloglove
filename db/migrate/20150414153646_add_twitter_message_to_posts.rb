class AddTwitterMessageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :twitter_message, :string
  end
end

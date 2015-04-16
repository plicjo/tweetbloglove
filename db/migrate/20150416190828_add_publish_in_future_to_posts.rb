class AddPublishInFutureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publish_in_future, :boolean, default: false
  end
end

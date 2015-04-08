class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :featured_image
      t.integer :author_id
      t.timestamps null: false
    end

    add_index :posts, :author_id
  end
end

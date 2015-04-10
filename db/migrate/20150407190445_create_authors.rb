class CreateAuthors < ActiveRecord::Migration
  def change
    create_table(:authors) do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :secret
      t.string :profile_image

      t.timestamps
    end
  end
end

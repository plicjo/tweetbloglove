class AddTimeZoneToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :time_zone, :string, default: 'Eastern Time (US & Canada)'
  end
end

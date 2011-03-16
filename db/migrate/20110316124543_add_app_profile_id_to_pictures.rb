class AddAppProfileIdToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :app_profile_id, :integer
  end

  def self.down
    remove_column :pictures, :app_profile_id
  end
end

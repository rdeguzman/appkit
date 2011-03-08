class AddAppProfileIdToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :app_profile_id, :integer
  end

  def self.down
    remove_column :pages, :app_profile_id
  end
end

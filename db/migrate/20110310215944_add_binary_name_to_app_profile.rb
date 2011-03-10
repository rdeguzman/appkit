class AddBinaryNameToAppProfile < ActiveRecord::Migration
  def self.up
    add_column :app_profiles, :binary_name, :string
    add_column :app_profiles, :itunes_product_name, :string
  end

  def self.down
    remove_column :app_profiles, :binary_name
    remove_column :app_profiles, :itunes_product_name
  end
end

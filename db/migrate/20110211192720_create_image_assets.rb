class CreateImageAssets < ActiveRecord::Migration
  def self.up
    create_table :image_assets do |t|
      t.references :user
      t.references :app_profile
      t.string :asset_type
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :image_assets
  end
end

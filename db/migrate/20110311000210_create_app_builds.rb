class CreateAppBuilds < ActiveRecord::Migration
  def self.up
    create_table :app_builds do |t|
      t.string :product_name
      t.string :binary_name
      t.string :version_number
      t.string :build_request_name
      t.text :comment 
      t.string :ipa_name #only admin can change this
      t.string :build_status #only admin can change this
      t.text :build_comment #only admin can change this
      t.references :app_profile
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :app_builds
  end
end

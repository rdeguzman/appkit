class CreateAppProfiles < ActiveRecord::Migration
  def self.up
    create_table :app_profiles do |t|
      t.references :user
      t.string  :app_name
      t.string  :background_front

      t.timestamps
    end
  end

  def self.down
    drop_table :app_profiles
  end
end

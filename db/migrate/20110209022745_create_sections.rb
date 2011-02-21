class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string  :title
      t.references :app_profile
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end

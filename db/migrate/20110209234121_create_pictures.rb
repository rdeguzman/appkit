class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :caption_title
      t.text :caption_description
      
      t.references :page
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end

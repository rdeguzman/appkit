class CreateButtons < ActiveRecord::Migration
  def self.up
    create_table  :buttons do |t|
      t.integer   :index, :default => 0
      t.string    :title
      t.string    :table_name
      t.integer   :parent_id
      t.references :app_profile
      t.timestamps
    end
  end

  def self.down
    drop_table :buttons
  end
end

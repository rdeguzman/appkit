class AddLongLatToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :longitude, :decimal, :precision => 12, :scale => 8
    add_column :pages, :latitude, :decimal, :precision => 12, :scale => 8
  end

  def self.down
    remove_column :pages, :longitude
    remove_column :pages, :latitude
  end
end

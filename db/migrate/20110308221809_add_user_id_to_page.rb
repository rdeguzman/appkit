class AddUserIdToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :user_id, :integer
  end

  def self.down
    remove_column :pages, :user_id
  end
end

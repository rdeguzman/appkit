class AddMetaDataToAppProfile < ActiveRecord::Migration
  def self.up
    add_column :app_profiles, :version_number, :string
    add_column :app_profiles, :description, :text
    add_column :app_profiles, :primary_category, :string
    add_column :app_profiles, :keywords, :string
    add_column :app_profiles, :copyright, :string
    add_column :app_profiles, :support_email_address, :string
    add_column :app_profiles, :support_url, :string
    add_column :app_profiles, :marketing_url, :string
    add_column :app_profiles, :review_notes, :text
  end

  def self.down
    remove_column :app_profiles, :version_number
    remove_column :app_profiles, :description
    remove_column :app_profiles, :primary_category
    remove_column :app_profiles, :keywords
    remove_column :app_profiles, :copyright
    remove_column :app_profiles, :support_email_address
    remove_column :app_profiles, :support_url
    remove_column :app_profiles, :marketing_url
    remove_column :app_profiles, :review_notes
  end
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110316124543) do

  create_table "app_builds", :force => true do |t|
    t.string   "product_name"
    t.string   "binary_name"
    t.string   "version_number"
    t.string   "build_request_name"
    t.text     "comment"
    t.string   "ipa_name"
    t.string   "build_status"
    t.text     "build_comment"
    t.integer  "app_profile_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "app_name"
    t.string   "background_front"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "version_number"
    t.text     "description"
    t.string   "primary_category"
    t.string   "keywords"
    t.string   "copyright"
    t.string   "support_email_address"
    t.string   "support_url"
    t.string   "marketing_url"
    t.text     "review_notes"
    t.string   "binary_name"
    t.string   "itunes_product_name"
  end

  create_table "buttons", :force => true do |t|
    t.integer  "index",          :default => 0
    t.string   "title"
    t.string   "table_name"
    t.integer  "parent_id"
    t.integer  "app_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_assets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "app_profile_id"
    t.string   "asset_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "content"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_profile_id"
    t.integer  "user_id"
    t.string   "type"
    t.decimal  "longitude",      :precision => 12, :scale => 8
    t.decimal  "latitude",       :precision => 12, :scale => 8
  end

  create_table "pictures", :force => true do |t|
    t.string   "caption_title"
    t.text     "caption_description"
    t.integer  "page_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "app_profile_id"
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.integer  "app_profile_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",       :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                                :default => "normal"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "udid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

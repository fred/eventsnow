# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100624042652) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "phone_number"
    t.text     "description"
    t.text     "extra_description"
    t.text     "location"
    t.text     "cil_code"
    t.text     "cil_code_mobile"
    t.integer  "author_id"
    t.integer  "speaker_type",                        :default => 0
    t.integer  "speakers_count",                      :default => 1
    t.integer  "maximum_users"
    t.float    "price"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "show_map",                            :default => false
    t.boolean  "active",                              :default => true
    t.boolean  "public_event",                        :default => true
    t.boolean  "private_event",                       :default => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document1_file_name"
    t.string   "document1_content_type"
    t.integer  "document1_file_size"
    t.datetime "document1_updated_at"
    t.string   "document2_file_name"
    t.string   "document2_content_type"
    t.integer  "document2_file_size"
    t.datetime "document2_updated_at"
    t.string   "document3_file_name"
    t.string   "document3_content_type"
    t.integer  "document3_file_size"
    t.datetime "document3_updated_at"
    t.string   "document4_file_name"
    t.string   "document4_content_type"
    t.integer  "document4_file_size"
    t.datetime "document4_updated_at"
    t.string   "document5_file_name"
    t.string   "document5_content_type"
    t.integer  "document5_file_size"
    t.datetime "document5_updated_at"
    t.string   "document6_file_name"
    t.string   "document6_content_type"
    t.integer  "document6_file_size"
    t.datetime "document6_updated_at"
    t.string   "language",               :limit => 4, :default => "eng"
    t.string   "currency",                            :default => "USD"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "owner_id"
    t.boolean  "allday",                              :default => false
    t.boolean  "featured",                            :default => false
    t.string   "sponsor_email"
    t.string   "sponsor_name"
  end

  add_index "events", ["active"], :name => "index_events_on_active"
  add_index "events", ["author_id"], :name => "index_events_on_author_id"
  add_index "events", ["language"], :name => "index_events_on_language"
  add_index "events", ["private_event"], :name => "index_events_on_private_event"
  add_index "events", ["public_event"], :name => "index_events_on_public_event"
  add_index "events", ["speaker_type"], :name => "index_events_on_speaker_type"
  add_index "events", ["speakers_count"], :name => "index_events_on_speakers_count"

  create_table "events_features", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "feature_id"
  end

  add_index "events_features", ["event_id"], :name => "index_events_features_on_event_id"
  add_index "events_features", ["feature_id"], :name => "index_events_features_on_feature_id"

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "remote_ip"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "body"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language",    :default => "en"
    t.string   "link_title"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.string   "var"
    t.text     "value"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["var"], :name => "index_settings_on_var", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "address"
    t.string   "phone"
    t.string   "name"
    t.string   "time_zone"
    t.text     "notes"
    t.boolean  "admin",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  add_index "users", ["single_access_token"], :name => "index_users_on_single_access_token", :unique => true

end

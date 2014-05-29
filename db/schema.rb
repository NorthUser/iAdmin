# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140506231738) do

  create_table "documents", :force => true do |t|
    t.string   "title",          :limit => 80
    t.string   "url"
    t.string   "type_attribute", :limit => 4
    t.integer  "event_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "pd_type_id"
  end

  create_table "event_permissions", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "participant_type_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "event_types", :force => true do |t|
    t.string   "name",       :limit => 80
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.integer  "event_type_id"
    t.datetime "date"
    t.integer  "place_id"
    t.text     "summary"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "participant_types", :force => true do |t|
    t.string   "name",        :limit => 30
    t.string   "type_access", :limit => 3
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "pd_type_id"
  end

  create_table "pd_types", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "document_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name",             :limit => 30
    t.string   "last_name",        :limit => 30
    t.string   "second_last_name", :limit => 30
    t.integer  "person_type_id"
    t.string   "membership"
    t.string   "academic_degree"
    t.text     "biography"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "controller",  :limit => 25
    t.string   "action",      :limit => 25
    t.string   "key",         :limit => 4
    t.string   "description", :limit => 120
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "person_types", :force => true do |t|
    t.string   "role",       :limit => 30
    t.string   "category"
    t.boolean  "public"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "name",        :limit => 20
    t.string   "permissions"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :limit => 20
    t.string   "password",   :limit => 64
    t.string   "email",      :limit => 35
    t.integer  "person_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "profile_id"
  end

end

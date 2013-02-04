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

ActiveRecord::Schema.define(:version => 20130201161203) do

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",        :limit => 40,  :null => false
    t.text     "description", :limit => 300
    t.datetime "start_date",                 :null => false
    t.datetime "end_date",                   :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id", "user_id"], :name => "index_projects_users_on_project_id_and_user_id"

  create_table "statuses", :force => true do |t|
    t.string   "status_name", :limit => 20
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "tickets", :force => true do |t|
    t.integer  "project_id"
    t.integer  "status_id"
    t.integer  "user_id"
    t.string   "name",        :limit => 40
    t.string   "description", :limit => 300
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "tickets", ["project_id", "status_id", "user_id"], :name => "index_tickets_on_project_id_and_status_id_and_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",    :limit => 20
    t.string   "last_name",     :limit => 40
    t.string   "email",         :limit => 200, :default => "", :null => false
    t.string   "password",      :limit => 40
    t.string   "password_salt"
    t.string   "password_hash"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

end

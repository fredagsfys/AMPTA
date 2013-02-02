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

ActiveRecord::Schema.define(:version => 20130202202822) do

  create_table "projects", :force => true do |t|
    t.string   "name",        :limit => 40
    t.string   "description", :limit => 150
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "status",     :limit => 40
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "tickets", :force => true do |t|
    t.integer  "project_id_id"
    t.integer  "status_id_id"
    t.integer  "user_id_id"
    t.string   "name",          :limit => 40
    t.string   "description",   :limit => 150
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "fname",      :limit => 20
    t.string   "lname",      :limit => 40
    t.string   "email",                    :default => "", :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "users_projects", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "users_projects", ["user_id", "project_id"], :name => "index_users_projects_on_user_id_and_project_id"

end

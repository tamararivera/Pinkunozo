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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140702053536) do

  create_table "acts", force: true do |t|
    t.integer  "project_id"
    t.integer  "secretary_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acts", ["project_id", "date"], name: "index_acts_on_project_id_and_date"

  create_table "milestones", force: true do |t|
    t.string   "name"
    t.text     "description",       limit: 255
    t.date     "date_of_creation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_milestone"
    t.string   "status"
    t.integer  "topic_id"
    t.integer  "parent_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.text     "discussion", limit: 255
    t.integer  "act_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_acts", force: true do |t|
    t.integer  "user_id"
    t.integer  "act_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_acts", ["act_id"], name: "index_user_acts_on_act_id"
  add_index "user_acts", ["user_id", "act_id"], name: "index_user_acts_on_user_id_and_act_id", unique: true
  add_index "user_acts", ["user_id"], name: "index_user_acts_on_user_id"

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id", "project_id"], name: "index_user_projects_on_user_id_and_project_id", unique: true
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end

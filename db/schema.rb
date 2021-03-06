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

ActiveRecord::Schema.define(version: 20160830155705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: true do |t|
    t.text     "caption"
    t.integer  "worksheet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attached_file"
    t.string   "image"
    t.string   "name"
  end

  create_table "comments", force: true do |t|
    t.text     "message"
    t.string   "priority"
    t.integer  "user_id"
    t.integer  "worksheet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id", "worksheet_id"], name: "index_comments_on_user_id_and_worksheet_id", using: :btree
  add_index "comments", ["worksheet_id"], name: "index_comments_on_worksheet_id", using: :btree

  create_table "test_images", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "worksheets", force: true do |t|
    t.string   "piw_id"
    t.string   "submitted_by"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "pre_load"
    t.string   "module"
    t.date     "date_opened"
    t.string   "incident_report_number"
    t.text     "description_as_is"
    t.text     "description_to_be"
    t.string   "impact"
    t.string   "requested_by"
    t.text     "action_taken"
    t.string   "action_taken_by"
    t.date     "date_closed"
    t.string   "status"
  end

  add_index "worksheets", ["user_id"], name: "index_worksheets_on_user_id", using: :btree

end

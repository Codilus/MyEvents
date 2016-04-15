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

ActiveRecord::Schema.define(version: 20160415135336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name",             null: false
    t.integer  "client_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.text     "description"
    t.integer  "number_of_guests"
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "promoter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "offers", ["event_id"], name: "index_offers_on_event_id", using: :btree
  add_index "offers", ["promoter_id"], name: "index_offers_on_promoter_id", using: :btree

  create_table "user_usages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "process_usage", default: 0, null: false
    t.integer "month",                     null: false
    t.integer "year",                      null: false
  end

  add_index "user_usages", ["user_id"], name: "index_user_usages_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name",             default: "",      null: false
    t.string   "last_name",              default: "",      null: false
    t.string   "type",                   default: "",      null: false
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "events", "users", column: "client_id"
  add_foreign_key "offers", "events"
  add_foreign_key "offers", "users", column: "promoter_id"
  add_foreign_key "user_usages", "users"
end

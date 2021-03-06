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

ActiveRecord::Schema.define(version: 20160429013303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "rate"
    t.datetime "start"
    t.datetime "end"
    t.string   "status"
    t.integer  "client_id"
    t.integer  "contractor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "chores", ["client_id"], name: "index_chores_on_client_id", using: :btree
  add_index "chores", ["contractor_id"], name: "index_chores_on_contractor_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.float    "rating"
    t.integer  "contractor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["contractor_id"], name: "index_clients_on_contractor_id", using: :btree

  create_table "networks", force: true do |t|
    t.integer  "client_id"
    t.integer  "contractor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chore_id"
  end

  add_index "networks", ["chore_id"], name: "index_networks_on_chore_id", using: :btree
  add_index "networks", ["client_id"], name: "index_networks_on_client_id", using: :btree
  add_index "networks", ["contractor_id"], name: "index_networks_on_contractor_id", using: :btree

  create_table "requests", force: true do |t|
    t.integer  "client_id"
    t.integer  "contractor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chore_id"
  end

  add_index "requests", ["chore_id"], name: "index_requests_on_chore_id", using: :btree
  add_index "requests", ["client_id"], name: "index_requests_on_client_id", using: :btree
  add_index "requests", ["contractor_id"], name: "index_requests_on_contractor_id", using: :btree

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
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

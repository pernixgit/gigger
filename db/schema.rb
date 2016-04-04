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

ActiveRecord::Schema.define(version: 20160404171511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "bands", ["email"], name: "index_bands_on_email", unique: true, using: :btree
  add_index "bands", ["reset_password_token"], name: "index_bands_on_reset_password_token", unique: true, using: :btree

  create_table "bands_event_types", id: false, force: :cascade do |t|
    t.integer "band_id"
    t.integer "event_type_id"
  end

  add_index "bands_event_types", ["band_id"], name: "index_bands_event_types_on_band_id", using: :btree
  add_index "bands_event_types", ["event_type_id"], name: "index_bands_event_types_on_event_type_id", using: :btree

  create_table "bands_genres", id: false, force: :cascade do |t|
    t.integer "band_id"
    t.integer "genre_id"
  end

  add_index "bands_genres", ["band_id"], name: "index_bands_genres_on_band_id", using: :btree
  add_index "bands_genres", ["genre_id"], name: "index_bands_genres_on_genre_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_types_musicians", id: false, force: :cascade do |t|
    t.integer "event_type_id"
    t.integer "musician_id"
  end

  add_index "event_types_musicians", ["event_type_id"], name: "index_event_types_musicians_on_event_type_id", using: :btree
  add_index "event_types_musicians", ["musician_id"], name: "index_event_types_musicians_on_musician_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "description"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "client_id"
    t.integer  "event_type_id"
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree
  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree

  create_table "events_event_types", id: false, force: :cascade do |t|
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_musicians", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "musician_id"
  end

  add_index "genres_musicians", ["genre_id"], name: "index_genres_musicians_on_genre_id", using: :btree
  add_index "genres_musicians", ["musician_id"], name: "index_genres_musicians_on_musician_id", using: :btree

  create_table "instrument_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "instrument_type_id"
  end

  add_index "instruments", ["instrument_type_id"], name: "index_instruments_on_instrument_type_id", using: :btree

  create_table "instruments_musicians", id: false, force: :cascade do |t|
    t.integer "instrument_id"
    t.integer "musician_id"
  end

  add_index "instruments_musicians", ["instrument_id"], name: "index_instruments_musicians_on_instrument_id", using: :btree
  add_index "instruments_musicians", ["musician_id"], name: "index_instruments_musicians_on_musician_id", using: :btree

  create_table "musicians", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "band_id"
  end

  add_index "musicians", ["band_id"], name: "index_musicians_on_band_id", using: :btree
  add_index "musicians", ["email"], name: "index_musicians_on_email", unique: true, using: :btree
  add_index "musicians", ["reset_password_token"], name: "index_musicians_on_reset_password_token", unique: true, using: :btree

  create_table "musicians_event_types", id: false, force: :cascade do |t|
    t.integer "musician_id"
    t.integer "event_type_id"
  end

  add_index "musicians_event_types", ["event_type_id"], name: "index_musicians_event_types_on_event_type_id", using: :btree
  add_index "musicians_event_types", ["musician_id"], name: "index_musicians_event_types_on_musician_id", using: :btree

  add_foreign_key "events", "clients"
  add_foreign_key "events", "event_types"
  add_foreign_key "instruments", "instrument_types"
  add_foreign_key "musicians", "bands"
end

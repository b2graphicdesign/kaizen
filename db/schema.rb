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

ActiveRecord::Schema.define(version: 20160204003935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "company_name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "patient_health_providers", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "provider_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "patient_transit_providers", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "transit_provider_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "email",                   limit: 25, default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",              limit: 25
    t.string   "last_name",               limit: 25
    t.string   "city",                    limit: 25
    t.string   "state",                   limit: 25
    t.string   "zip",                     limit: 15
    t.string   "phone",                   limit: 15
    t.string   "username",                limit: 15
    t.integer  "provider_id"
    t.string   "address_1",               limit: 25
    t.string   "address_2",               limit: 25
    t.string   "county",                  limit: 25
    t.text     "address_notes"
    t.string   "alternate_contact_name",  limit: 25
    t.string   "alternate_contact_phone", limit: 15
    t.string   "alternate_contact_email", limit: 25
    t.boolean  "alert_call"
    t.boolean  "alert_sms"
    t.boolean  "alert_email"
    t.boolean  "alert_alternate_call"
    t.boolean  "alert_alternate_sms"
    t.boolean  "alert_alternate_email"
    t.string   "payer",                   limit: 15
    t.string   "payer_state",             limit: 15
    t.string   "payer_id",                limit: 25
    t.string   "transportation_type"
    t.text     "assistance_notes"
    t.text     "comments"
  end

  add_index "patients", ["email"], name: "index_patients_on_email", unique: true, using: :btree
  add_index "patients", ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true, using: :btree

  create_table "providers", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "company_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "provider_type"
  end

  add_index "providers", ["email"], name: "index_providers_on_email", unique: true, using: :btree
  add_index "providers", ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true, using: :btree

  create_table "rides", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "transit_provider_id"
    t.integer  "patient_id"
    t.integer  "provider_id"
    t.datetime "pickup_time"
    t.string   "comments"
  end

  create_table "transit_providers", force: :cascade do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "company_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "transit_type"
  end

  add_index "transit_providers", ["email"], name: "index_transit_providers_on_email", unique: true, using: :btree
  add_index "transit_providers", ["reset_password_token"], name: "index_transit_providers_on_reset_password_token", unique: true, using: :btree

end

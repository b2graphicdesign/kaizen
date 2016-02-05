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

ActiveRecord::Schema.define(version: 20160205132255) do

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

  create_table "drivers", force: :cascade do |t|
    t.string   "email",                       limit: 25, default: "", null: false
    t.string   "encrypted_password",                     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "transport_id"
    t.string   "username",                    limit: 15
    t.string   "first_name",                  limit: 25
    t.string   "last_name",                   limit: 25
    t.string   "address_1",                   limit: 25
    t.string   "address_2",                   limit: 25
    t.string   "city",                        limit: 25
    t.string   "state",                       limit: 25
    t.string   "zip",                         limit: 15
    t.string   "phone",                       limit: 15
    t.string   "insurance_company",           limit: 50
    t.string   "insurance_account",           limit: 50
    t.string   "drivers_license_state",       limit: 25
    t.string   "drivers_license_no",          limit: 25
    t.datetime "drivers_license_expiry"
    t.integer  "vehicle_year"
    t.string   "vehicle_make",                limit: 25
    t.string   "vehicle_model",               limit: 25
    t.string   "vehicle_type",                limit: 25
    t.string   "vehicle_color",               limit: 25
    t.string   "vehicle_license_plate",       limit: 10
    t.datetime "vehicle_registration_expiry"
  end

  add_index "drivers", ["email"], name: "index_drivers_on_email", unique: true, using: :btree
  add_index "drivers", ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true, using: :btree

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
    t.string   "email",                  limit: 15, default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "city",                   limit: 25
    t.string   "state",                  limit: 25
    t.string   "zip",                    limit: 15
    t.string   "username",               limit: 15
    t.string   "facility_name",          limit: 50
    t.string   "address_1",              limit: 25
    t.string   "address_2",              limit: 25
    t.string   "county",                 limit: 25
    t.text     "address_notes"
    t.string   "phone",                  limit: 15
    t.string   "fax",                    limit: 15
  end

  add_index "providers", ["email"], name: "index_providers_on_email", unique: true, using: :btree
  add_index "providers", ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true, using: :btree

  create_table "rides", force: :cascade do |t|
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "patient_id"
    t.integer  "provider_id"
    t.text     "comments"
    t.integer  "driver_id"
    t.integer  "transport_id"
    t.string   "ride_type"
    t.datetime "appointment_time"
    t.datetime "expected_start_time"
    t.datetime "actual_start_time"
    t.datetime "expected_end_time"
    t.datetime "actual_end_time"
    t.decimal  "expected_mileage",    precision: 10, scale: 2
    t.decimal  "actual_mileage",      precision: 10, scale: 2
    t.string   "ride_status"
    t.integer  "feedback_rating"
    t.text     "feedback_comments"
  end

  create_table "transportations", force: :cascade do |t|
    t.string   "email",                  limit: 25, default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "username",               limit: 25
    t.string   "company_name",           limit: 50
    t.string   "address_1",              limit: 25
    t.string   "address_2",              limit: 25
    t.string   "city",                   limit: 25
    t.string   "state",                  limit: 25
    t.string   "zip",                    limit: 15
    t.string   "phone",                  limit: 15
    t.string   "fax",                    limit: 15
  end

  add_index "transportations", ["email"], name: "index_transportations_on_email", unique: true, using: :btree
  add_index "transportations", ["reset_password_token"], name: "index_transportations_on_reset_password_token", unique: true, using: :btree

end

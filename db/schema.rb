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

ActiveRecord::Schema.define(version: 0) do

  create_table "admins", primary_key: "admin_id", force: :cascade do |t|
    t.string   "username",               limit: 15,               null: false
    t.string   "encrypted_password",     limit: 100,              null: false
    t.string   "email",                  limit: 30,               null: false
    t.string   "first_name",             limit: 30,  default: ""
    t.string   "last_name",              limit: 30,  default: ""
    t.string   "full_name",              limit: 50,  default: "", null: false
    t.string   "company",                limit: 50,  default: "", null: false
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 20,  default: "", null: false
    t.string   "last_sign_in_ip",        limit: 20,  default: "", null: false
    t.string   "reset_password_token",   limit: 100
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["username"], name: "username", unique: true, using: :btree

  create_table "call_log", primary_key: "call_id", force: :cascade do |t|
    t.string   "session_id",  limit: 50, default: "", null: false
    t.string   "phone_from",  limit: 15
    t.string   "phone_to",    limit: 15
    t.string   "msg",         limit: 50, default: "", null: false
    t.integer  "patient_id",  limit: 4,  default: 0,  null: false
    t.integer  "provider_id", limit: 4,  default: 0,  null: false
    t.integer  "ride_id",     limit: 4,  default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "call_queue", primary_key: "call_queue_id", force: :cascade do |t|
    t.datetime "send_at",                             null: false
    t.string   "phone_to",    limit: 15
    t.string   "msg",         limit: 50, default: "", null: false
    t.integer  "patient_id",  limit: 4,  default: 0,  null: false
    t.integer  "provider_id", limit: 4,  default: 0,  null: false
    t.integer  "ride_id",     limit: 4,  default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "hospital_department", primary_key: "department_id", force: :cascade do |t|
    t.integer  "hospital_id",     limit: 4,   default: 0,  null: false
    t.integer  "system_id",       limit: 4,   default: 0,  null: false
    t.string   "department_name", limit: 100, default: "", null: false
    t.string   "address_1",       limit: 50,  default: "", null: false
    t.string   "address_2",       limit: 50,  default: "", null: false
    t.string   "city",            limit: 50,  default: "", null: false
    t.string   "state",           limit: 15,  default: "", null: false
    t.string   "zip",             limit: 10,  default: "", null: false
    t.string   "phone",           limit: 15,  default: "", null: false
    t.string   "email",           limit: 50,  default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "hospital_sites", primary_key: "site_id", force: :cascade do |t|
    t.integer  "department_id", limit: 4,   default: 0,  null: false
    t.integer  "hospital_id",   limit: 4,   default: 0,  null: false
    t.integer  "system_id",     limit: 4,   default: 0,  null: false
    t.string   "facility_name", limit: 100, default: "", null: false
    t.string   "address_1",     limit: 50,  default: "", null: false
    t.string   "address_2",     limit: 50,  default: "", null: false
    t.string   "city",          limit: 50,  default: "", null: false
    t.string   "state",         limit: 15,  default: "", null: false
    t.string   "zip",           limit: 10,  default: "", null: false
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.string   "phone",         limit: 15,  default: "", null: false
    t.string   "email",         limit: 50,  default: "", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "hospital_system", primary_key: "system_id", force: :cascade do |t|
    t.string   "system_name", limit: 100, default: "", null: false
    t.string   "address_1",   limit: 50,  default: "", null: false
    t.string   "address_2",   limit: 50,  default: "", null: false
    t.string   "city",        limit: 50,  default: "", null: false
    t.string   "state",       limit: 15,  default: "", null: false
    t.string   "zip",         limit: 10,  default: "", null: false
    t.string   "phone",       limit: 15,  default: "", null: false
    t.string   "email",       limit: 50,  default: "", null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "hospitals", primary_key: "hospital_id", force: :cascade do |t|
    t.integer  "system_id",     limit: 4,   default: 0,  null: false
    t.string   "facility_name", limit: 100, default: "", null: false
    t.string   "address_1",     limit: 50,  default: "", null: false
    t.string   "address_2",     limit: 50,  default: "", null: false
    t.string   "city",          limit: 50,  default: "", null: false
    t.string   "state",         limit: 15,  default: "", null: false
    t.string   "zip",           limit: 10,  default: "", null: false
    t.string   "phone",         limit: 15,  default: "", null: false
    t.string   "email",         limit: 50,  default: "", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "patients", primary_key: "patient_id", force: :cascade do |t|
    t.integer  "system_id",               limit: 4,     default: 0,     null: false
    t.integer  "department_id",           limit: 4,     default: 0,     null: false
    t.string   "username",                limit: 25,    default: "",    null: false
    t.string   "encrypted_password",      limit: 100,   default: "",    null: false
    t.string   "email",                   limit: 100,   default: "",    null: false
    t.string   "first_name",              limit: 25,    default: "",    null: false
    t.string   "last_name",               limit: 25,    default: "",    null: false
    t.string   "address_1",               limit: 50,    default: "",    null: false
    t.string   "address_2",               limit: 50,    default: "",    null: false
    t.string   "city",                    limit: 50,    default: "",    null: false
    t.string   "state",                   limit: 50,    default: "",    null: false
    t.string   "zip",                     limit: 15,    default: "",    null: false
    t.string   "county",                  limit: 50,    default: "",    null: false
    t.text     "address_notes",           limit: 65535,                 null: false
    t.string   "phone",                   limit: 15,    default: "",    null: false
    t.string   "payer",                   limit: 50,    default: "",    null: false
    t.string   "payer_state",             limit: 25,    default: "",    null: false
    t.string   "payer_id",                limit: 25,    default: "",    null: false
    t.string   "alternate_contact_name",  limit: 50,    default: "",    null: false
    t.string   "alternate_contact_phone", limit: 15,    default: "",    null: false
    t.string   "alternate_contact_email", limit: 50,    default: "",    null: false
    t.boolean  "alert_call"
    t.boolean  "alert_sms"
    t.boolean  "alert_email"
    t.boolean  "alert_alternate_call"
    t.boolean  "alert_alternate_sms"
    t.boolean  "alert_alternate_email"
    t.string   "transportation_type",     limit: 25,    default: "",    null: false
    t.text     "assistance_notes",        limit: 65535,                 null: false
    t.text     "comments",                limit: 65535,                 null: false
    t.string   "reset_password_token",    limit: 50
    t.datetime "reset_password_sent_at"
    t.boolean  "send_password_email",                   default: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",      limit: 15,    default: "",    null: false
    t.string   "last_sign_in_ip",         limit: 15,    default: "",    null: false
    t.datetime "created_at"
    t.datetime "update_at"
  end

  add_index "patients", ["username"], name: "username", unique: true, using: :btree

  create_table "providers", primary_key: "provider_id", force: :cascade do |t|
    t.integer  "department_id",          limit: 4,     default: 0,  null: false
    t.integer  "hospital_id",            limit: 4,     default: 0,  null: false
    t.integer  "system_id",              limit: 4,     default: 0,  null: false
    t.string   "username",               limit: 15,                 null: false
    t.string   "encrypted_password",     limit: 100,                null: false
    t.string   "email",                  limit: 50,    default: "", null: false
    t.string   "facility_name",          limit: 100,   default: "", null: false
    t.string   "address_1",              limit: 50,    default: "", null: false
    t.string   "address_2",              limit: 50,    default: "", null: false
    t.string   "city",                   limit: 50,    default: "", null: false
    t.string   "state",                  limit: 25,    default: "", null: false
    t.string   "zip",                    limit: 15,    default: "", null: false
    t.string   "county",                 limit: 25,    default: "", null: false
    t.text     "address_notes",          limit: 65535,              null: false
    t.string   "phone",                  limit: 15,    default: "", null: false
    t.string   "fax",                    limit: 15,    default: "", null: false
    t.string   "reset_password_token",   limit: 100,   default: "", null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 15,    default: "", null: false
    t.string   "last_sign_in_ip",        limit: 15,    default: "", null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "providers", ["username"], name: "username", unique: true, using: :btree
  add_index "providers", ["username"], name: "username_2", unique: true, using: :btree

  create_table "ride_log", primary_key: "ride_id", force: :cascade do |t|
    t.integer  "patient_id",        limit: 4,  default: 0,  null: false
    t.integer  "provider_id",       limit: 4,  default: 0,  null: false
    t.datetime "appointment_at"
    t.string   "status",            limit: 15, default: "", null: false
    t.datetime "expected_start_at"
    t.datetime "actual_start_at"
    t.datetime "expected_end_at"
    t.datetime "actual_end_at"
    t.float    "start_lat",         limit: 24
    t.float    "start_long",        limit: 24
    t.float    "end_lat",           limit: 24
    t.float    "end_long",          limit: 24
    t.float    "actual_mileage",    limit: 24
    t.float    "expected_mileage",  limit: 24
    t.string   "ride_service",      limit: 10, default: "", null: false
    t.string   "ride_type",         limit: 25, default: "", null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "ride_queue", primary_key: "ride_queue_id", force: :cascade do |t|
    t.integer  "patient_id",        limit: 4,                  null: false
    t.integer  "provider_id",       limit: 4,                  null: false
    t.datetime "appointment_at",                               null: false
    t.string   "status",            limit: 15,                 null: false
    t.boolean  "verified",                     default: false, null: false
    t.datetime "expected_start_at",                            null: false
    t.datetime "actual_start_at",                              null: false
    t.datetime "expected_end_at",                              null: false
    t.datetime "actual_end_at",                                null: false
    t.float    "start_lat",         limit: 24,                 null: false
    t.float    "start_long",        limit: 24,                 null: false
    t.float    "end_lat",           limit: 24,                 null: false
    t.float    "end_long",          limit: 24,                 null: false
    t.float    "actual_mileage",    limit: 24,                 null: false
    t.float    "expected_mileage",  limit: 24,                 null: false
    t.string   "ride_service",      limit: 10,                 null: false
    t.string   "ride_type",         limit: 25,                 null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "sms_log", primary_key: "sms_id", force: :cascade do |t|
    t.string   "message_id",  limit: 50,  default: ""
    t.string   "phone_from",  limit: 15,  default: "",    null: false
    t.string   "phone_to",    limit: 15,  default: "",    null: false
    t.string   "msg",         limit: 255, default: ""
    t.boolean  "sent",                    default: false, null: false
    t.integer  "patient_id",  limit: 4,   default: 0
    t.integer  "provider_id", limit: 4,   default: 0,     null: false
    t.integer  "ride_id",     limit: 4,   default: 0,     null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "sms_queue", primary_key: "sms_queue_id", force: :cascade do |t|
    t.datetime "send_at"
    t.string   "phone_to",    limit: 15,  default: "", null: false
    t.string   "msg",         limit: 255, default: "", null: false
    t.integer  "patient_id",  limit: 4,   default: 0,  null: false
    t.integer  "provider_id", limit: 4,   default: 0,  null: false
    t.integer  "ride_id",     limit: 4,   default: 0,  null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

end

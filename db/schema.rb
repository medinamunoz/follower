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

ActiveRecord::Schema.define(version: 20170319143119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "establishment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["establishment_id"], name: "index_departments_on_establishment_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "summary_phase_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["summary_phase_id"], name: "index_documents_on_summary_phase_id", using: :btree
  end

  create_table "establishments", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_establishments_on_city_id", using: :btree
  end

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.string   "description"
    t.text     "note"
    t.integer  "resolution"
    t.datetime "starting_day"
    t.datetime "close_day"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "summary_phases", force: :cascade do |t|
    t.integer  "summary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "phase"
    t.index ["summary_id"], name: "index_summary_phases_on_summary_id", using: :btree
  end

  create_table "summary_users", force: :cascade do |t|
    t.integer  "summary_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "type"
    t.index ["summary_id"], name: "index_summary_users_on_summary_id", using: :btree
    t.index ["user_id"], name: "index_summary_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "sure_name"
    t.string   "last_name"
    t.string   "rut"
    t.integer  "department_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "departments", "establishments"
  add_foreign_key "documents", "summary_phases"
  add_foreign_key "establishments", "cities"
  add_foreign_key "summary_phases", "summaries"
  add_foreign_key "summary_users", "summaries"
  add_foreign_key "summary_users", "users"
end

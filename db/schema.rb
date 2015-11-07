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

ActiveRecord::Schema.define(version: 20151107055050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.integer  "organogram_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "subarea_id"
  end

  add_index "areas", ["subarea_id"], name: "index_areas_on_subarea_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dimensions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "perfomance_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "dimensions", ["perfomance_id"], name: "index_dimensions_on_perfomance_id", using: :btree

  create_table "federations", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "junior_companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "federation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "organograms", force: :cascade do |t|
    t.integer  "federation_id"
    t.integer  "junior_company_id"
    t.date     "date_initial"
    t.date     "date_final"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "perfomance_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "userLogged"
    t.integer  "perfomance_id"
    t.integer  "dimension_id"
    t.integer  "question_id"
    t.integer  "value"
    t.string   "text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "perfomance_answers", ["dimension_id"], name: "index_perfomance_answers_on_dimension_id", using: :btree
  add_index "perfomance_answers", ["perfomance_id"], name: "index_perfomance_answers_on_perfomance_id", using: :btree
  add_index "perfomance_answers", ["question_id"], name: "index_perfomance_answers_on_question_id", using: :btree
  add_index "perfomance_answers", ["user_id"], name: "index_perfomance_answers_on_user_id", using: :btree

  create_table "perfomances", force: :cascade do |t|
    t.string   "name"
    t.string   "junior_companies_id"
    t.string   "federations_id"
    t.integer  "role_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.integer  "dimension_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "questions", ["dimension_id"], name: "index_questions_on_dimension_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "area_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "organogram_id"
    t.integer  "suprole_id"
  end

  add_index "roles", ["organogram_id"], name: "index_roles_on_organogram_id", using: :btree
  add_index "roles", ["suprole_id"], name: "index_roles_on_suprole_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dimensions", "perfomances"
  add_foreign_key "perfomance_answers", "dimensions"
  add_foreign_key "perfomance_answers", "perfomances"
  add_foreign_key "perfomance_answers", "questions"
  add_foreign_key "perfomance_answers", "users"
  add_foreign_key "questions", "dimensions"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_13_025241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_interest_areas", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "interest_area_id"
    t.index ["candidate_id"], name: "index_candidate_interest_areas_on_candidate_id"
    t.index ["interest_area_id"], name: "index_candidate_interest_areas_on_interest_area_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "cpf"
    t.string "phone"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "experience"
    t.string "cep"
    t.string "city"
    t.string "long"
    t.string "lat"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_id"
    t.index ["match_id"], name: "index_chatrooms_on_match_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "cnpj"
    t.string "company_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_description"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "interest_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "description"
    t.string "address"
    t.float "salary"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interest_area_id"
    t.string "cep"
    t.string "city"
    t.string "lat"
    t.string "long"
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "matches", force: :cascade do |t|
    t.boolean "matched", default: false
    t.bigint "candidate_id", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "distance"
    t.boolean "dislike"
    t.index ["candidate_id"], name: "index_matches_on_candidate_id"
    t.index ["job_id"], name: "index_matches_on_job_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_company"
    t.integer "role"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidate_interest_areas", "candidates"
  add_foreign_key "candidate_interest_areas", "interest_areas"
  add_foreign_key "candidates", "users"
  add_foreign_key "chatrooms", "matches"
  add_foreign_key "companies", "users"
  add_foreign_key "jobs", "companies"
  add_foreign_key "matches", "candidates"
  add_foreign_key "matches", "jobs"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end

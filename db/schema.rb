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

ActiveRecord::Schema[7.1].define(version: 2024_05_10_234137) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candidate_interest_areas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "interest_area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_area_id"], name: "index_candidate_interest_areas_on_interest_area_id"
    t.index ["user_id"], name: "index_candidate_interest_areas_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.index ["match_id"], name: "index_chatrooms_on_match_id"
    t.index ["receiver_id"], name: "index_chatrooms_on_receiver_id"
    t.index ["sender_id"], name: "index_chatrooms_on_sender_id"
  end

  create_table "distances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "job_id", null: false
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_distances_on_job_id"
    t.index ["user_id"], name: "index_distances_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interest_area_id"
    t.string "cep"
    t.string "city"
    t.string "lat"
    t.string "long"
    t.float "longitude"
    t.float "latitude"
    t.bigint "user_id"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "state"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.boolean "matched", default: false
    t.bigint "user_id", null: false
    t.bigint "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "dislike"
    t.index ["job_id"], name: "index_matches_on_job_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
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
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.string "cpf"
    t.string "experience"
    t.string "company_name"
    t.string "cnpj"
    t.string "phone"
    t.string "zip"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.float "lat"
    t.float "long"
    t.boolean "is_company"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "candidate_interest_areas", "interest_areas"
  add_foreign_key "candidate_interest_areas", "users"
  add_foreign_key "chatrooms", "matches"
  add_foreign_key "chatrooms", "users", column: "receiver_id"
  add_foreign_key "chatrooms", "users", column: "sender_id"
  add_foreign_key "distances", "jobs"
  add_foreign_key "distances", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "matches", "jobs"
  add_foreign_key "matches", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end

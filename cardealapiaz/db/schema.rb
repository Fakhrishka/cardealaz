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

ActiveRecord::Schema.define(version: 2021_09_09_014108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apiusers", force: :cascade do |t|
    t.string "login", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login"], name: "index_apiusers_on_login", unique: true
    t.index ["reset_password_token"], name: "index_apiusers_on_reset_password_token", unique: true
  end

  create_table "body_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brands", force: :cascade do |t|
    t.bigint "distributor_id", null: false
    t.string "name"
    t.string "moto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["distributor_id"], name: "index_brands_on_distributor_id"
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "car_data", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.integer "price"
    t.string "name"
    t.integer "engine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_data_on_car_id"
  end

  create_table "cars", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "model"
    t.integer "test_drive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_cars_on_brand_id"
  end

  create_table "distributors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_drives", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.string "person"
    t.string "phone"
    t.string "personid"
    t.date "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_test_drives_on_brand_id"
    t.index ["car_id"], name: "index_test_drives_on_car_id"
  end

  create_table "user_infos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "user_type"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "login", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brands", "distributors"
  add_foreign_key "brands", "users"
  add_foreign_key "car_data", "cars"
  add_foreign_key "cars", "brands"
  add_foreign_key "test_drives", "brands"
  add_foreign_key "test_drives", "cars"
  add_foreign_key "user_infos", "users"
end

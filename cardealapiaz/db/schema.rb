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

ActiveRecord::Schema.define(version: 2021_08_24_121601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.index ["distributor_id"], name: "index_brands_on_distributor_id"
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

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.string "hashed_password"
    t.bigint "distributor_id", null: false
    t.bigint "brand_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_users_on_brand_id"
    t.index ["distributor_id"], name: "index_users_on_distributor_id"
  end

  add_foreign_key "brands", "distributors"
  add_foreign_key "cars", "brands"
  add_foreign_key "users", "brands"
  add_foreign_key "users", "distributors"
end

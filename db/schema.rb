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

ActiveRecord::Schema.define(version: 2023_10_08_055539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_histories", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "payment_option_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_histories_on_cart_id"
    t.index ["payment_option_id"], name: "index_cart_histories_on_payment_option_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "service_id", null: false
    t.date "date"
    t.time "time"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["service_id"], name: "index_cart_items_on_service_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "payment_options", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_categories", force: :cascade do |t|
    t.string "name"
    t.text "image"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_category_id"
    t.string "name"
    t.text "description"
    t.text "image"
    t.decimal "price", precision: 12, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_category_id"], name: "index_services_on_service_category_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.date "start_date"
    t.time "start_time"
    t.time "end_time"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "end_date"
    t.integer "duration"
    t.integer "interval"
    t.index ["service_id"], name: "index_time_slots_on_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cart_histories", "carts"
  add_foreign_key "cart_histories", "payment_options"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "services"
  add_foreign_key "carts", "users"
  add_foreign_key "services", "service_categories"
  add_foreign_key "services", "users"
  add_foreign_key "time_slots", "services"
end

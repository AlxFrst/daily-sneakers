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

ActiveRecord::Schema.define(version: 2022_05_31_095050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.boolean "private"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "sneakers_id", null: false
    t.bigint "users_id", null: false
    t.bigint "conditions_id", null: false
    t.bigint "status_id", null: false
    t.decimal "price_buy"
    t.date "buying_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conditions_id"], name: "index_collections_on_conditions_id"
    t.index ["sneakers_id"], name: "index_collections_on_sneakers_id"
    t.index ["status_id"], name: "index_collections_on_status_id"
    t.index ["users_id"], name: "index_collections_on_users_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "users_id", null: false
    t.bigint "chatrooms_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatrooms_id"], name: "index_messages_on_chatrooms_id"
    t.index ["users_id"], name: "index_messages_on_users_id"
  end

  create_table "prices", force: :cascade do |t|
    t.date "timestamp"
    t.bigint "sneakers_id", null: false
    t.decimal "price"
    t.string "market"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sneakers_id"], name: "index_prices_on_sneakers_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.decimal "US"
    t.decimal "EU"
    t.decimal "UK"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sneakers", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "votes"
    t.bigint "sizes_id", null: false
    t.integer "year"
    t.string "color"
    t.string "reference"
    t.bigint "genders_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genders_id"], name: "index_sneakers_on_genders_id"
    t.index ["sizes_id"], name: "index_sneakers_on_sizes_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "nickname"
    t.string "coutry"
    t.integer "wallet"
    t.bigint "sizes_id", null: false
    t.date "birthdate"
    t.bigint "genders_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["genders_id"], name: "index_users_on_genders_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sizes_id"], name: "index_users_on_sizes_id"
  end

  create_table "whishlists", force: :cascade do |t|
    t.bigint "sneakers_id", null: false
    t.bigint "users_id", null: false
    t.decimal "price_alert"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sneakers_id"], name: "index_whishlists_on_sneakers_id"
    t.index ["users_id"], name: "index_whishlists_on_users_id"
  end

  add_foreign_key "collections", "conditions", column: "conditions_id"
  add_foreign_key "collections", "sneakers", column: "sneakers_id"
  add_foreign_key "collections", "statuses"
  add_foreign_key "collections", "users", column: "users_id"
  add_foreign_key "messages", "chatrooms", column: "chatrooms_id"
  add_foreign_key "messages", "users", column: "users_id"
  add_foreign_key "prices", "sneakers", column: "sneakers_id"
  add_foreign_key "sneakers", "genders", column: "genders_id"
  add_foreign_key "sneakers", "sizes", column: "sizes_id"
  add_foreign_key "users", "genders", column: "genders_id"
  add_foreign_key "users", "sizes", column: "sizes_id"
  add_foreign_key "whishlists", "sneakers", column: "sneakers_id"
  add_foreign_key "whishlists", "users", column: "users_id"
end

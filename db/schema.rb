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

ActiveRecord::Schema[7.1].define(version: 2023_10_11_020539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.integer "rent_value"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "property_type"
    t.integer "operation_type"
    t.text "description"
    t.string "address"
    t.boolean "pet_friendly"
    t.string "area"
    t.integer "property_price"
    t.integer "maintenance_price"
    t.text "urls", default: [], array: true
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.string "name"
    t.string "phone_number"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "users_properties", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "property_id"
    t.boolean "is_contacted"
    t.boolean "is_saved"
    t.index ["property_id"], name: "index_users_properties_on_property_id"
    t.index ["user_id", "property_id"], name: "index_users_properties_on_user_id_and_property_id", unique: true
    t.index ["user_id"], name: "index_users_properties_on_user_id"
  end

  add_foreign_key "properties", "users"
end

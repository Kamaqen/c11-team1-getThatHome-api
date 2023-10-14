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

ActiveRecord::Schema[7.1].define(version: 2023_10_14_161659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.integer "rent_value"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "property_type"
    t.integer "operation_type"
    t.string "urls"
    t.text "description"
    t.string "address"
    t.boolean "pet_friendly"
    t.string "area"
    t.integer "property_price"
    t.integer "maintenance_price"
    t.boolean "is_active"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "user_properties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.boolean "saved", default: false
    t.boolean "contacted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_user_properties_on_property_id"
    t.index ["user_id"], name: "index_user_properties_on_user_id"
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

  add_foreign_key "properties", "users"
  add_foreign_key "user_properties", "properties"
  add_foreign_key "user_properties", "users"
end

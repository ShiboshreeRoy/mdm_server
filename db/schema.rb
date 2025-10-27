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

ActiveRecord::Schema[7.2].define(version: 2025_10_27_155041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_records", force: :cascade do |t|
    t.bigint "enterprise_id", null: false
    t.string "package_name"
    t.string "title"
    t.boolean "managed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_app_records_on_enterprise_id"
  end

  create_table "devices", force: :cascade do |t|
    t.bigint "enterprise_id", null: false
    t.string "device_id"
    t.string "platform"
    t.boolean "enrolled"
    t.datetime "last_seen"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_devices_on_enterprise_id"
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "provider"
    t.string "name"
    t.jsonb "credentials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "app_records", "enterprises"
  add_foreign_key "devices", "enterprises"
end

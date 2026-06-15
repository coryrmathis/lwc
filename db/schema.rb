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

ActiveRecord::Schema[7.2].define(version: 2026_06_15_191826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.integer "bpm"
    t.integer "length_seconds"
    t.text "lyrics"
    t.text "notes"
    t.string "status", default: "idea", null: false
    t.string "key"
    t.boolean "is_cover", default: false, null: false
    t.string "original_artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "chord_chart"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.string "contact_first_name"
    t.string "contact_last_name"
    t.string "contact_email"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "website"
    t.text "notes"
    t.datetime "last_contacted_at"
    t.datetime "next_follow_up_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end

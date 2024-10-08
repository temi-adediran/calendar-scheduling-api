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

ActiveRecord::Schema[7.1].define(version: 2024_07_09_003829) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_dates", force: :cascade do |t|
    t.date "date", null: false
    t.string "time_slots", default: [], array: true
    t.bigint "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_available_dates_on_coach_id"
    t.index ["date"], name: "index_available_dates_on_date"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "time_booked", null: false
    t.integer "rating"
    t.text "note"
    t.bigint "coach_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_bookings_on_coach_id"
    t.index ["student_id"], name: "index_bookings_on_student_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recurring_hours", force: :cascade do |t|
    t.string "MON", default: [], array: true
    t.string "TUE", default: [], array: true
    t.string "WED", default: [], array: true
    t.string "THU", default: [], array: true
    t.string "FRI", default: [], array: true
    t.string "SAT", default: [], array: true
    t.string "SUN", default: [], array: true
    t.bigint "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_recurring_hours_on_coach_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_no"
    t.string "memberable_type"
    t.bigint "memberable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memberable_type", "memberable_id"], name: "index_users_on_memberable"
  end

end

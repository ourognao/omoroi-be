# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190131144908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_pictures", force: :cascade do |t|
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "qquuid"
    t.text "original"
    t.text "thumbnail"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "title"
    t.string "location_jp"
    t.string "access_jp"
    t.date "date"
    t.string "start_time"
    t.string "end_time"
    t.integer "cost"
    t.integer "capacity"
    t.integer "threshold"
    t.text "explanation_jp"
    t.string "positions", array: true
    t.string "tags", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section", array: true
    t.text "explanation_en"
    t.string "location_en"
    t.string "access_en"
    t.string "event_location_name_jp"
    t.string "event_location_name_en"
    t.index ["date"], name: "index_events_on_date"
    t.index ["tags"], name: "index_events_on_tags"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "release_emails", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.integer "expected_people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reservations_on_event_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.integer "kind"
    t.integer "status"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "line"
    t.string "uprovider", default: "email"
    t.string "facebook_id", default: "nil"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end

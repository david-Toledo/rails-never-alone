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

ActiveRecord::Schema.define(version: 2021_02_02_114205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.text "title"
    t.text "location"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "post_created"
  end

  create_table "responses", force: :cascade do |t|
    t.text "body"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "last_name"
    t.text "email"
    t.text "password_digest"
    t.text "image"
    t.text "address"
    t.float "longitude"
    t.float "latitude"
    t.boolean "admin"
    t.boolean "user_active"
    t.integer "user_type"
    t.text "police_check"
    t.text "national_id"
    t.text "covid_safe_certifcate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

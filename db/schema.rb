# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160315020728) do

  create_table "business_categories", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_categories", ["business_id"], name: "index_business_categories_on_business_id"
  add_index "business_categories", ["category_id"], name: "index_business_categories_on_category_id"

  create_table "business_cities", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_cities", ["business_id"], name: "index_business_cities_on_business_id"
  add_index "business_cities", ["city_id"], name: "index_business_cities_on_city_id"

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "aka"
    t.string   "logo"
    t.text     "description"
    t.string   "location"
    t.integer  "zip_code"
    t.string   "website"
    t.string   "establidhed"
    t.string   "email"
    t.integer  "nr_of_employess"
    t.string   "payment_mathod"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.integer  "prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "flag_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "phone_type"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "phones", ["business_id"], name: "index_phones_on_business_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "name"
    t.string   "source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "photos", ["business_id"], name: "index_photos_on_business_id"

  create_table "products", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["business_id"], name: "index_products_on_business_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "name"
    t.string   "source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "videos", ["business_id"], name: "index_videos_on_business_id"

  create_table "working_days", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "day"
    t.time     "open"
    t.time     "close"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "working_days", ["business_id"], name: "index_working_days_on_business_id"

end

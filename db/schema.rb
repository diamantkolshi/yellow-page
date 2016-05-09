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

ActiveRecord::Schema.define(version: 20160505162711) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"

  create_table "business_addresses", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_addresses", ["address_id"], name: "index_business_addresses_on_address_id"
  add_index "business_addresses", ["business_id"], name: "index_business_addresses_on_business_id"

  create_table "business_categories", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_categories", ["business_id"], name: "index_business_categories_on_business_id"
  add_index "business_categories", ["category_id"], name: "index_business_categories_on_category_id"

  create_table "business_products", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "product_id"
    t.string   "description"
    t.decimal  "price"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_products", ["business_id"], name: "index_business_products_on_business_id"
  add_index "business_products", ["product_id"], name: "index_business_products_on_product_id"

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "aka"
    t.string   "logo"
    t.text     "description"
    t.string   "location"
    t.integer  "zip_code"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "google"
    t.string   "established"
    t.string   "email"
    t.integer  "nr_of_employess"
    t.string   "payment_mathod"
    t.decimal  "average_rate",    default: 0.0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
  end

  add_index "businesses", ["slug"], name: "index_businesses_on_slug"

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

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "business_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["business_id"], name: "index_comments_on_business_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "flag_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.string   "name"
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
    t.integer  "type_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "products", ["type_id"], name: "index_products_on_type_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "business_id"
    t.decimal  "score"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suggest_businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "tel"
    t.text     "message"
    t.boolean  "confirm",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "suggest_edits", force: :cascade do |t|
    t.boolean  "business_closed"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "established"
    t.integer  "zip_code"
    t.string   "business_tel"
    t.string   "fax_number"
    t.text     "opening_hours"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "google"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "suggest_photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "business_id"
    t.string   "source"
    t.boolean  "confirm",     default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "name"
    t.boolean  "admin",                  default: false, null: false
    t.string   "logo"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
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
    t.integer  "day_id"
    t.time     "open"
    t.time     "close"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "working_days", ["business_id"], name: "index_working_days_on_business_id"
  add_index "working_days", ["day_id"], name: "index_working_days_on_day_id"

end

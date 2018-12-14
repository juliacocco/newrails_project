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

ActiveRecord::Schema.define(version: 2018_12_11_135644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.string "description"
    t.integer "stock"
    t.bigint "shop_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["product_id"], name: "index_offers_on_product_id"
    t.index ["shop_id"], name: "index_offers_on_shop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "price_snapshot"
    t.jsonb "payment_info"
    t.bigint "offer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "units", default: 1
    t.integer "rating", default: 0
    t.index ["offer_id"], name: "index_orders_on_offer_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "bar_code"
    t.string "model"
    t.string "brand"
    t.string "category"
    t.string "product_type"
    t.string "specs"
    t.float "average_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "numbervote", default: 10
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "stars"
    t.bigint "product_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ratings_on_product_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "commercial_name"
    t.string "legal_name"
    t.string "company_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.boolean "seller"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_users_on_shop_id"
  end

  add_foreign_key "offers", "products"
  add_foreign_key "offers", "shops"
  add_foreign_key "orders", "offers"
  add_foreign_key "orders", "users"
  add_foreign_key "ratings", "products"
  add_foreign_key "ratings", "users"
  add_foreign_key "users", "shops"
end

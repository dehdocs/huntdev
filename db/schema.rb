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

ActiveRecord::Schema.define(version: 20170222014144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_ranges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_find_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "product_find_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["product_find_id"], name: "index_product_find_tags_on_product_find_id", using: :btree
    t.index ["tag_id"], name: "index_product_find_tags_on_tag_id", using: :btree
  end

  create_table "product_finds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "url"
    t.decimal  "price"
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_product_finds_on_product_id", using: :btree
    t.index ["user_id"], name: "index_product_finds_on_user_id", using: :btree
  end

  create_table "product_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_tags_on_product_id", using: :btree
    t.index ["tag_id"], name: "index_product_tags_on_tag_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.string   "title"
    t.integer  "category_id"
    t.integer  "price_range_id"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["price_range_id"], name: "index_products_on_price_range_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "city"
    t.string   "country"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "product_find_tags", "product_finds"
  add_foreign_key "product_find_tags", "tags"
  add_foreign_key "product_finds", "products"
  add_foreign_key "product_finds", "users"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "price_ranges"
  add_foreign_key "products", "users"
end

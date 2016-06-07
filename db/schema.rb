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

ActiveRecord::Schema.define(version: 20160606223006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impact_entries", force: :cascade do |t|
    t.float    "value",                       default: 0.0
    t.string   "unit",                        default: ""
    t.integer  "product_impact_line_item_id"
    t.integer  "category_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "impact_entries", ["category_id"], name: "index_impact_entries_on_category_id", using: :btree
  add_index "impact_entries", ["product_impact_line_item_id"], name: "index_impact_entries_on_product_impact_line_item_id", using: :btree

  create_table "impact_line_items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_impact_line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "impact_line_item_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "product_impact_line_items", ["impact_line_item_id"], name: "index_product_impact_line_items_on_impact_line_item_id", using: :btree
  add_index "product_impact_line_items", ["product_id"], name: "index_product_impact_line_items_on_product_id", using: :btree

  create_table "product_rels", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.integer  "child_quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.string   "barcode_type"
    t.string   "barcode"
    t.string   "contact_email"
    t.string   "details_url"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "start_address"
    t.float    "start_longitude"
    t.float    "start_latitude"
    t.string   "end_address"
    t.float    "end_longitude"
    t.float    "end_latitude"
  end

  add_index "products", ["barcode"], name: "index_products_on_barcode", unique: true, using: :btree
  add_index "products", ["description"], name: "index_products_on_description", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", unique: true, using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "impact_entries", "categories"
  add_foreign_key "impact_entries", "product_impact_line_items"
  add_foreign_key "product_impact_line_items", "impact_line_items"
  add_foreign_key "product_impact_line_items", "products"
  add_foreign_key "products", "users"
end

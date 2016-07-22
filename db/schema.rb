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

ActiveRecord::Schema.define(version: 20160722205324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "inventory_shipment_assignments", force: :cascade do |t|
    t.integer  "inventory_id"
    t.integer  "shipment_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "retails", force: :cascade do |t|
    t.string   "name"
    t.boolean  "wheelchair_accessible"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.date     "expected_departure_date"
    t.date     "actual_departure_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "type"
    t.integer  "location_id"
    t.string   "location_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.integer  "loading_docks"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end

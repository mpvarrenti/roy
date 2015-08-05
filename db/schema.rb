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

ActiveRecord::Schema.define(version: 20150804065217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lights", force: :cascade do |t|
    t.string   "name"
    t.integer  "watts"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "option_lights", force: :cascade do |t|
    t.integer  "light_id"
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "option_lights", ["light_id"], name: "index_option_lights_on_light_id", using: :btree
  add_index "option_lights", ["option_id"], name: "index_option_lights_on_option_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "building_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["building_id"], name: "index_options_on_building_id", using: :btree

  add_foreign_key "option_lights", "lights"
  add_foreign_key "option_lights", "options"
  add_foreign_key "options", "buildings"
end

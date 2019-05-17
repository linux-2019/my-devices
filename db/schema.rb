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

ActiveRecord::Schema.define(version: 2019_05_17_125413) do

  create_table "devices", force: :cascade do |t|
    t.string "mac"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stats", force: :cascade do |t|
    t.integer "device_id"
    t.string "disk_free"
    t.string "disk_total"
    t.string "memory_free"
    t.string "memory_total"
    t.string "uptime"
    t.string "hostname"
    t.string "kernel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string "ip_address"
    t.integer "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

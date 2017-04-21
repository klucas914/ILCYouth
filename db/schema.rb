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

ActiveRecord::Schema.define(version: 20170421001331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "events_groups", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "group_id", null: false
    t.index ["event_id", "group_id"], name: "index_events_groups_on_event_id_and_group_id", using: :btree
    t.index ["group_id", "event_id"], name: "index_events_groups_on_group_id_and_event_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_students", id: false, force: :cascade do |t|
    t.integer "group_id",   null: false
    t.integer "student_id", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
  end

  add_foreign_key "students", "groups"
end

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

ActiveRecord::Schema.define(version: 20151209163238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefit_categories", force: :cascade do |t|
    t.string   "benefit_name", limit: 60, null: false
    t.integer  "meansure",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",       limit: 10, null: false
    t.string   "full_name",  limit: 60, null: false
    t.string   "address",    limit: 60
    t.string   "person",     limit: 60, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "faculty_hostels", force: :cascade do |t|
    t.integer  "faculty_id"
    t.integer  "hostel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "faculty_hostels", ["faculty_id"], name: "index_faculty_hostels_on_faculty_id", using: :btree
  add_index "faculty_hostels", ["hostel_id"], name: "index_faculty_hostels_on_hostel_id", using: :btree

  create_table "hostels", force: :cascade do |t|
    t.integer  "number",          null: false
    t.string   "head_name",       null: false
    t.integer  "roominess",       null: false
    t.integer  "number_occupied", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "student_benefits", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "benefit_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "student_benefits", ["benefit_category_id"], name: "index_student_benefits_on_benefit_category_id", using: :btree
  add_index "student_benefits", ["student_id"], name: "index_student_benefits_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 30,             null: false
    t.integer  "age",                               null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "faculty_id"
    t.integer  "hostel_id",             default: 0
  end

  add_index "students", ["faculty_id"], name: "index_students_on_faculty_id", using: :btree

  add_foreign_key "students", "faculties"
end

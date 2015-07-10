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

ActiveRecord::Schema.define(version: 20150703010934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "paypal_email"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "is_admin",         default: false
    t.boolean  "status",           default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "history_transactions", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "name"
    t.decimal  "saving_employee"
    t.decimal  "saving_company"
    t.decimal  "salary"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "history_transactions", ["employee_id"], name: "index_history_transactions_on_employee_id", using: :btree

  create_table "salaries", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "salaries", ["employee_id"], name: "index_salaries_on_employee_id", using: :btree

  create_table "saving_companies", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saving_companies", ["employee_id"], name: "index_saving_companies_on_employee_id", using: :btree

  create_table "saving_employees", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "saving_employees", ["employee_id"], name: "index_saving_employees_on_employee_id", using: :btree

  create_table "total_amounts", force: :cascade do |t|
    t.integer  "employee_id"
    t.decimal  "total_company"
    t.decimal  "total_employee"
    t.decimal  "total"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "total_amounts", ["employee_id"], name: "index_total_amounts_on_employee_id", using: :btree

end

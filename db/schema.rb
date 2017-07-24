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

ActiveRecord::Schema.define(version: 20170724183735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checks", force: :cascade do |t|
    t.integer "check_id"
    t.float "check_total"
    t.string "check_name"
    t.bigint "payroll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payroll_id"], name: "index_checks_on_payroll_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_i"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.string "gender"
    t.integer "id_number"
    t.string "admin", default: "No"
    t.boolean "status", default: true
    t.date "hire_date"
    t.integer "workers_comp_class"
    t.string "work_location"
    t.date "birthday"
    t.string "jobtype"
    t.integer "rate", default: 12
    t.string "paid_by", default: "check"
    t.string "social_security_number"
    t.integer "federal_filing_status"
    t.integer "federal_filing_allowances"
    t.integer "state_filing_status"
    t.integer "state_filing_allowances"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payperiods", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "payroll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "reg_hours"
    t.float "ovr_hours"
    t.index ["employee_id"], name: "index_payperiods_on_employee_id"
    t.index ["payroll_id"], name: "index_payperiods_on_payroll_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_payrolls_on_employee_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "checks", "payrolls"
  add_foreign_key "payperiods", "employees"
  add_foreign_key "payperiods", "payrolls"
  add_foreign_key "payrolls", "employees"
end

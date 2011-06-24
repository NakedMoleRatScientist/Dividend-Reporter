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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110623165144) do

  create_table "quotes", :force => true do |t|
    t.integer  "stock_id"
    t.decimal  "dividend_share"
    t.decimal  "price"
    t.date     "ex_date"
    t.date     "pay_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "yield"
  end

  create_table "stocks", :force => true do |t|
    t.string   "symbol"
    t.string   "company_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  create_table "watchlists", :force => true do |t|
    t.integer  "watched_id"
    t.integer  "watching_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

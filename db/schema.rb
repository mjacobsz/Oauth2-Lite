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

ActiveRecord::Schema.define(:version => 20110314164743) do

  create_table "clients", :force => true do |t|
    t.string "name"
    t.string "client_id"
    t.string "client_secret"
  end

  create_table "tokens", :force => true do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.string   "access_token_exchange_code"
    t.string   "access_token_exchange_code_issue_date"
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expiry_date"
    t.boolean  "revoked",                               :default => false
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

end
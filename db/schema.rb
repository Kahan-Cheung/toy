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

ActiveRecord::Schema.define(version: 20160119182002) do

  create_table "articles", force: :cascade do |t|
    t.text     "name"
    t.text     "content"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["group_id"], name: "index_articles_on_group_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "introduce"
    t.integer  "ltnum"
    t.integer  "nownum"
    t.string   "ccode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["ccode", "created_at"], name: "index_groups_on_ccode_and_created_at"

  create_table "menbers", force: :cascade do |t|
    t.integer  "authority"
    t.integer  "status"
    t.string   "message"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menbers", ["group_id"], name: "index_menbers_on_group_id"
  add_index "menbers", ["user_id"], name: "index_menbers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "academy"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

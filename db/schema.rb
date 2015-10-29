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

ActiveRecord::Schema.define(version: 20151027130425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.integer  "user_id"
    t.string   "experience"
    t.string   "hours"
    t.string   "description"
    t.integer  "skill_id"
    t.integer  "company_id"
    t.integer  "industry_id"
    t.integer  "salary_min"
    t.integer  "salary_max"
    t.string   "location"
    t.boolean  "remote"
  end

  add_index "links", ["company_id"], name: "index_links_on_company_id", using: :btree
  add_index "links", ["industry_id"], name: "index_links_on_industry_id", using: :btree
  add_index "links", ["skill_id"], name: "index_links_on_skill_id", using: :btree
  add_index "links", ["slug"], name: "index_links_on_slug", using: :btree
  add_index "links", ["user_id"], name: "index_links_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "token_id"
    t.string   "image"
    t.string   "url"
    t.string   "gender"
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "remember_digest"
    t.string   "email"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["token_id"], name: "index_users_on_token_id", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end

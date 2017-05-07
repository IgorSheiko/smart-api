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

ActiveRecord::Schema.define(version: 20170425150509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "sex"
    t.date    "birth_date"
    t.string  "phone_number"
    t.integer "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer "user_id"
    t.string  "project_name"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "room_categories", force: :cascade do |t|
    t.string "room_name"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "project_id"
    t.integer "room_category_id"
  end

  create_table "rooms_systems", force: :cascade do |t|
    t.integer "room_id"
    t.integer "system_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "system_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest",      default: "", null: false
    t.string "email"
    t.string "authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

end

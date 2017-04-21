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

ActiveRecord::Schema.define(version: 20170410165999) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.boolean  "done"
    t.integer  "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "level"
    t.integer  "section_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
    t.index ["section_id"], name: "index_permissions_on_section_id"
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "permission_id", null: false
    t.integer "role_id",       null: false
    t.index ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "type_number"
    t.boolean  "primary"
    t.string   "country_code"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.string   "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar_url"
    t.string   "identity"
    t.string   "type_identity"
    t.string   "description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end

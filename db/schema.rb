# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_09_014959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assignedreqs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "requirement_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["requirement_id"], name: "index_assignedreqs_on_requirement_id"
    t.index ["user_id"], name: "index_assignedreqs_on_user_id"
  end

  create_table "interestedevents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "post_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["post_id"], name: "index_interestedevents_on_post_id"
    t.index ["user_id"], name: "index_interestedevents_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.date "event_date"
    t.string "event_title"
    t.string "location"
    t.bigint "organizer_id", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_posts_on_organizer_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "post_id", null: false
    t.string "req_description"
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_requirements_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "assignedreqs", "requirements"
  add_foreign_key "assignedreqs", "users"
  add_foreign_key "interestedevents", "posts"
  add_foreign_key "interestedevents", "users"
  add_foreign_key "posts", "users", column: "organizer_id"
  add_foreign_key "requirements", "posts"
end

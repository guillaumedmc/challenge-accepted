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

ActiveRecord::Schema.define(version: 2020_01_29_205028) do

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "reward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "completion_date"
    t.integer "user_id"
    t.string "theme"
    t.string "gif"
    t.integer "gif_id"
    t.index ["gif_id"], name: "index_challenges_on_gif_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "challenge_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_comments_on_challenge_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "gifs", force: :cascade do |t|
    t.text "name"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "challenge_id"
    t.integer "rank"
    t.index ["challenge_id"], name: "index_participants_on_challenge_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "rankings", force: :cascade do |t|
    t.integer "user_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rankings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "photo"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.text "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema.define(version: 2019_02_26_150408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.string "resource_type"
    t.bigint "resource_id"
    t.integer "amount"
    t.integer "choice"
    t.float "odds"
    t.bigint "participation_id"
    t.boolean "success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participation_id"], name: "index_bets_on_participation_id"
    t.index ["resource_type", "resource_id"], name: "index_bets_on_resource_type_and_resource_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status", default: "opened"
    t.integer "creator_id"
    t.integer "coins_init"
    t.string "category"
    t.integer "players_nb"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_contests_on_creator_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.string "choice_one"
    t.string "choice_two"
    t.integer "choice_win"
    t.bigint "contest_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status", default: "coming"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_events_on_contest_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "player_one_id"
    t.bigint "player_two_id"
    t.integer "score_p_one"
    t.integer "score_p_two"
    t.integer "winner"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status", default: "coming"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "game_code"
    t.integer "phase"
    t.index ["player_one_id"], name: "index_games_on_player_one_id"
    t.index ["player_two_id"], name: "index_games_on_player_two_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "contest_id"
    t.float "betcoins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_participations_on_contest_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "contest_id"
    t.string "name"
    t.string "status", default: "phase_1"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_players_on_contest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bets", "participations"
  add_foreign_key "contests", "users", column: "creator_id"
  add_foreign_key "events", "contests"
  add_foreign_key "events", "users"
  add_foreign_key "games", "players", column: "player_one_id"
  add_foreign_key "games", "players", column: "player_two_id"
  add_foreign_key "participations", "contests"
  add_foreign_key "participations", "users"
  add_foreign_key "players", "contests"
end

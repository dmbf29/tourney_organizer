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

ActiveRecord::Schema.define(version: 20170924133642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["group_id"], name: "index_entries_on_group_id"
    t.index ["player_id"], name: "index_entries_on_player_id"
    t.index ["team_id"], name: "index_entries_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "winner_id"
    t.integer "loser_id"
    t.integer "entry_home_score"
    t.integer "entry_away_score"
    t.integer "entry_home_score_aet"
    t.string "entry_away_score_aet"
    t.boolean "draw"
    t.integer "entry_home_id"
    t.integer "entry_away_id"
    t.bigint "tournament_id"
    t.bigint "group_id"
    t.bigint "screen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_games_on_group_id"
    t.index ["screen_id"], name: "index_games_on_screen_id"
    t.index ["tournament_id"], name: "index_games_on_tournament_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "tournament_id"
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_groups_on_tournament_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "badge"
    t.string "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "winner_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entries_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entries", "groups"
  add_foreign_key "entries", "players"
  add_foreign_key "entries", "teams"
  add_foreign_key "games", "groups"
  add_foreign_key "games", "screens"
  add_foreign_key "games", "tournaments"
  add_foreign_key "groups", "tournaments"
end
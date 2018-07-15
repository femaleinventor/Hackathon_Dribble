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

ActiveRecord::Schema.define(version: 20180715071505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_leagues_on_sport_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "result"
    t.string "channel"
    t.time "start_time"
    t.date "start_date"
    t.bigint "league_id"
    t.bigint "away_team_id"
    t.bigint "home_team_id"
    t.bigint "sport_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ref_id"
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
    t.index ["league_id"], name: "index_matches_on_league_id"
    t.index ["sport_id"], name: "index_matches_on_sport_id"
    t.index ["venue_id"], name: "index_matches_on_venue_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.string "guess"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reason"
    t.integer "likes"
    t.bigint "user_id"
    t.bigint "match_id"
    t.bigint "question_id"
    t.index ["match_id"], name: "index_predictions_on_match_id"
    t.index ["question_id"], name: "index_predictions_on_question_id"
    t.index ["user_id"], name: "index_predictions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "display_text"
    t.string "response_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_id"
    t.bigint "ref_id"
    t.index ["match_id"], name: "index_questions_on_match_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "nickname"
    t.string "bright_color"
    t.string "light_color"
    t.string "dark_color"
    t.string "twitter_list"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_teams_on_sport_id"
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
    t.string "username"
    t.string "twitter_handle"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.string "time_zone"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "picture_url"
    t.string "address"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "leagues", "sports"
  add_foreign_key "matches", "leagues"
  add_foreign_key "matches", "sports"
  add_foreign_key "matches", "venues"
  add_foreign_key "players", "teams"
  add_foreign_key "predictions", "users"
  add_foreign_key "teams", "sports"
end

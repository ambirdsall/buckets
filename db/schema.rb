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

ActiveRecord::Schema.define(version: 20150515230843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "nba_stats_id"
    t.string   "game_date"
    t.boolean  "playoffs"
    t.boolean  "win"
    t.integer  "pts"
    t.integer  "fga"
    t.integer  "fgm"
    t.float    "fg_pct"
    t.integer  "min"
    t.integer  "fg3a"
    t.integer  "fg3m"
    t.float    "fg3_pct"
    t.integer  "fta"
    t.integer  "ftm"
    t.float    "ft_pct"
    t.integer  "oreb"
    t.integer  "dreb"
    t.integer  "reb"
    t.integer  "ast"
    t.integer  "stl"
    t.integer  "blk"
    t.integer  "tov"
    t.integer  "pf"
    t.integer  "plus_minus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "games", ["nba_stats_id"], name: "index_games_on_nba_stats_id", using: :btree
  add_index "games", ["player_id"], name: "index_games_on_player_id", using: :btree
  add_index "games", ["playoffs"], name: "index_games_on_playoffs", using: :btree
  add_index "games", ["win"], name: "index_games_on_win", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "nba_stats_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "players", ["nba_stats_id"], name: "index_players_on_nba_stats_id", using: :btree

  add_foreign_key "games", "players"
end

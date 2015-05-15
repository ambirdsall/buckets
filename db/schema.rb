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
    t.integer  "season_id"
    t.integer  "points"
    t.integer  "field_goals_attempted"
    t.integer  "field_goals_made"
    t.integer  "threes_attempted"
    t.integer  "threes_made"
    t.integer  "offensive_rebounds"
    t.integer  "defensive_rebounds"
    t.integer  "free_throws_attempted"
    t.integer  "free_throws_made"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "turnovers"
    t.integer  "fouls"
    t.integer  "plus_minus"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "height"
    t.boolean  "retired"
    t.boolean  "hall_of_fame"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "year"
    t.integer  "games_played"
    t.integer  "games_total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end

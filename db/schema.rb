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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130917075155) do

  create_table "counties", :force => true do |t|
    t.integer  "state_id"
    t.string   "abbr"
    t.string   "name"
    t.string   "county_seat"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "counties", ["name"], :name => "index_counties_on_name"
  add_index "counties", ["state_id"], :name => "index_counties_on_state_id"

  create_table "states", :force => true do |t|
    t.string   "abbr",       :limit => 2
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "states", ["abbr"], :name => "index_states_on_abbr"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "zipcodes", :force => true do |t|
    t.string   "code"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "county_id"
    t.string   "area_code"
    t.decimal  "lat",        :precision => 15, :scale => 10
    t.decimal  "lon",        :precision => 15, :scale => 10
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "zipcodes", ["code"], :name => "index_zipcodes_on_code"
  add_index "zipcodes", ["county_id"], :name => "index_zipcodes_on_county_id"
  add_index "zipcodes", ["lat", "lon"], :name => "index_zipcodes_on_lat_and_lon"
  add_index "zipcodes", ["state_id"], :name => "index_zipcodes_on_state_id"

end

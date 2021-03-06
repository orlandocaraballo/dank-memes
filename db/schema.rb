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

ActiveRecord::Schema.define(version: 20160406201048) do

  create_table "memes", force: :cascade do |t|
    t.string   "source"
    t.string   "title"
    t.string   "permalink"
    t.string   "asset_url"
    t.string   "domain"
    t.string   "protocol"
    t.string   "asset_type"
    t.datetime "asset_created_at"
    t.string   "source_url"
  end

end

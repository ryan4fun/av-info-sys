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

ActiveRecord::Schema.define(:version => 20130529075846) do

  create_table "actions", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "actor_activity", :force => true do |t|
    t.integer  "actor_id",     :null => false
    t.integer  "action",       :null => false
    t.string   "content"
    t.integer  "target_id",    :null => false
    t.string   "target_type",  :null => false
    t.datetime "created_time", :null => false
  end

  create_table "actors", :force => true do |t|
    t.integer  "agency_id"
    t.string   "cn_name",     :null => false
    t.string   "en_name",     :null => false
    t.string   "jp_name"
    t.string   "nation"
    t.string   "weight"
    t.text     "introduce"
    t.string   "birth_place"
    t.string   "cup"
    t.string   "BWH"
    t.string   "height"
    t.datetime "birthday"
    t.text     "wiki"
    t.float    "total_mark"
    t.integer  "mark_time"
  end

  create_table "agency", :force => true do |t|
    t.string  "official_site"
    t.text    "introduce"
    t.string  "name",          :null => false
    t.text    "text"
    t.integer "mark_time"
    t.float   "total_mark"
  end

  create_table "agency_activity", :force => true do |t|
    t.integer "agency_id",   :null => false
    t.integer "action",      :null => false
    t.integer "target_id",   :null => false
    t.string  "target_type", :null => false
  end

  create_table "attachment", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "target_id",   :null => false
    t.string  "target_type", :null => false
    t.string  "path"
    t.string  "type",        :null => false
  end

  create_table "categories", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "description"
    t.integer "parent_id"
  end

  create_table "category_relations", :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "actor_id"
    t.integer "movie_id"
    t.integer "agency_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "content",     :null => false
    t.datetime "create_date", :null => false
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "parent_id"
  end

  create_table "group_user_relations", :force => true do |t|
    t.integer  "group_id",  :null => false
    t.integer  "user_id",   :null => false
    t.datetime "join_time", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "create_date", :null => false
  end

  create_table "movie_actor_relations", :force => true do |t|
    t.integer "movie_id"
    t.integer "actor_id"
  end

  create_table "movies", :force => true do |t|
    t.string  "name",       :null => false
    t.text    "wiki",       :null => false
    t.integer "mark_time"
    t.float   "total_mark"
  end

  create_table "parameter", :force => true do |t|
    t.string "key",   :null => false
    t.string "value", :null => false
  end

  create_table "tag_relations", :force => true do |t|
    t.integer "tag_id",     :null => false
    t.integer "comment_id"
    t.integer "users_id"
    t.integer "movie_id"
    t.integer "agency_id"
  end

  create_table "tags", :force => true do |t|
    t.string "name",        :null => false
    t.string "description"
  end

  create_table "user_activity", :force => true do |t|
    t.integer  "action",      :null => false
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "create_date", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",      :null => false
    t.string   "password",      :null => false
    t.string   "nickname"
    t.string   "email",         :null => false
    t.datetime "register_date", :null => false
  end

end

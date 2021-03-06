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

ActiveRecord::Schema.define(:version => 20130111191228) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "courts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courts_reservations", :id => false, :force => true do |t|
    t.integer "court_id"
    t.integer "reservation_id"
  end

  add_index "courts_reservations", ["court_id", "reservation_id"], :name => "index_courts_reservations_on_court_id_and_reservation_id"

  create_table "items", :force => true do |t|
    t.integer  "item_number"
    t.float    "value"
    t.string   "description"
    t.date     "purchase_date"
    t.integer  "category_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "items_reservations", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "reservation_id"
  end

  add_index "items_reservations", ["item_id", "reservation_id"], :name => "index_items_reservations_on_item_id_and_reservation_id"

  create_table "reservations", :force => true do |t|
    t.date     "reservation_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "user_id"
    t.integer  "number_of_participants"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end

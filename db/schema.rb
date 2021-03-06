# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100205000245) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.text     "address"
    t.string   "rsvp_key"
    t.boolean  "attending"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent_thank_you"
    t.boolean  "bride"
    t.integer  "number_estimate"
    t.integer  "category_id"
    t.text     "present_description"
    t.integer  "num_carrot",          :default => 0, :null => false
    t.integer  "num_chocolate",       :default => 0, :null => false
    t.integer  "num_cheese",          :default => 0, :null => false
    t.integer  "num_vanilla",         :default => 0, :null => false
    t.text     "rsvp_note"
    t.datetime "rsvp_on"
    t.boolean  "stamped_p"
  end

  create_table "songs", :force => true do |t|
    t.string   "name"
    t.string   "artist"
    t.string   "role"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

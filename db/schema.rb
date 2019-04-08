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

ActiveRecord::Schema.define(version: 2019_03_30_061729) do

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.integer "price_per_night"
    t.string "city"
    t.integer "max_guests"
    t.integer "cleanliness_rating"
    t.integer "location_rating"
    t.integer "value_rating"
    t.integer "reviews_count"
    t.boolean "pets_allowed"
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_houses_on_owner_id"
  end

  create_table "stays", force: :cascade do |t|
    t.string "guest_id"
    t.string "house_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "budget"
    t.integer "guests"
    t.boolean "pets", default: false
    t.boolean "owner", default: false
  end

end

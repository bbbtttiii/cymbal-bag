# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_02_131107) do

  create_table "bags", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.integer "cymbal_id"
    t.integer "user_id"
    t.integer "bag_id"
  end

  create_table "cymbals", force: :cascade do |t|
    t.string "brand"
    t.string "line"
    t.string "cym_type"
    t.string "finish"
    t.integer "diameter"
    t.float "weight"
    t.string "cym_model"
  end

  create_table "drums", force: :cascade do |t|
    t.string "brand"
    t.string "drum_model"
    t.integer "diameter"
    t.integer "depth"
    t.string "material"
    t.string "heads"
    t.string "hoops"
    t.string "wires"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "drum_id"
    t.integer "user_id"
    t.integer "brightness"
    t.integer "resonance"
    t.text "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.integer "u_id"
    t.string "google_token"
    t.string "google_refresh_token"
  end

end

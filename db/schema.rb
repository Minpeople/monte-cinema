# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_08_103957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinema_halls", force: :cascade do |t|
    t.string "name", null: false
    t.integer "capacity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.integer "duration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "screenings", force: :cascade do |t|
    t.datetime "date", null: false
    t.integer "cinema_hall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "movie_id"
    t.index ["cinema_hall_id"], name: "index_screenings_on_cinema_hall_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "cinema_hall_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "code"
    t.index ["cinema_hall_id"], name: "index_seats_on_cinema_hall_id"
  end

  create_table "ticket_desks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
  end

  create_table "tickets", force: :cascade do |t|
    t.float "price", null: false
    t.integer "type"
    t.integer "seat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "screening_id"
    t.bigint "ticket_desk_id"
    t.string "code"
    t.index ["screening_id"], name: "index_tickets_on_screening_id"
    t.index ["seat_id", "screening_id"], name: "index_tickets_on_seat_id_and_screening_id", unique: true
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
    t.index ["ticket_desk_id"], name: "index_tickets_on_ticket_desk_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.bigint "ticket_desk_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["ticket_desk_id"], name: "index_users_on_ticket_desk_id"
  end

  create_table "vouchers", force: :cascade do |t|
    t.integer "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_vouchers_on_user_id"
  end

  add_foreign_key "screenings", "movies"
  add_foreign_key "seats", "cinema_halls"
  add_foreign_key "tickets", "screenings"
  add_foreign_key "tickets", "seats"
  add_foreign_key "tickets", "ticket_desks"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "ticket_desks"
  add_foreign_key "vouchers", "users"
end

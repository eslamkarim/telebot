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

ActiveRecord::Schema.define(version: 2020_07_11_165814) do

  create_table "chats", force: :cascade do |t|
    t.string "first_name"
    t.string "username"
    t.string "bot_id"
    t.string "last_name"
  end

  create_table "messages", force: :cascade do |t|
    t.string "message_id"
    t.string "date"
    t.string "text"
    t.integer "chat_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "offsets", force: :cascade do |t|
    t.string "bot_id"
    t.integer "offset", default: 0
  end

  add_foreign_key "messages", "chats"
end

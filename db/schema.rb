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

ActiveRecord::Schema.define(version: 20161121113551) do

  create_table "admin_translations", force: :cascade do |t|
    t.integer  "admin_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "text"
    t.index ["admin_id"], name: "index_admin_translations_on_admin_id"
    t.index ["locale"], name: "index_admin_translations_on_locale"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "version_number"
    t.string   "email"
    t.string   "telephone"
    t.string   "address"
    t.string   "image"
    t.integer  "products_last_position"
    t.integer  "wines_last_position"
    t.integer  "services_last_position"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "article_translations", force: :cascade do |t|
    t.integer  "article_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "text"
    t.index ["article_id"], name: "index_article_translations_on_article_id"
    t.index ["locale"], name: "index_article_translations_on_locale"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_translations", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "text"
    t.index ["event_id"], name: "index_event_translations_on_event_id"
    t.index ["locale"], name: "index_event_translations_on_locale"
  end

  create_table "events", force: :cascade do |t|
    t.string   "image"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notification_translations", force: :cascade do |t|
    t.integer  "notification_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "title"
    t.text     "text"
    t.index ["locale"], name: "index_notification_translations_on_locale"
    t.index ["notification_id"], name: "index_notification_translations_on_notification_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "text"
    t.index ["locale"], name: "index_product_translations_on_locale"
    t.index ["product_id"], name: "index_product_translations_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "image"
    t.integer  "position"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema.define(version: 20170427183106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "editions", force: :cascade do |t|
    t.text "name"
  end

  create_table "event_tags", force: :cascade do |t|
    t.integer "event_id"
    t.integer "tag_id"
  end

  create_table "events", force: :cascade do |t|
    t.text     "name"
    t.text     "detail"
    t.text     "summary"
    t.datetime "updated_at"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "group_id"
    t.integer "person_id"
  end

  create_table "group_sources", force: :cascade do |t|
    t.integer "source_id", default: -> { "nextval('group_sources_book_seq'::regclass)" },  null: false
    t.integer "group_id",  default: -> { "nextval('group_sources_group_seq'::regclass)" }, null: false
    t.text    "pages"
  end

  create_table "group_tags", force: :cascade do |t|
    t.integer "group_id"
    t.integer "tag_id"
  end

  create_table "groups", force: :cascade do |t|
    t.text     "name"
    t.text     "kind"
    t.text     "notes"
    t.text     "subtype"
    t.datetime "updated_at"
  end

  create_table "incidents", force: :cascade do |t|
    t.integer "event_id"
    t.integer "occurrence_id"
  end

  create_table "location_sources", id: :integer, default: -> { "nextval('location_references_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "source_id",   default: -> { "nextval('location_references_book_seq'::regclass)" },     null: false
    t.integer "location_id", default: -> { "nextval('location_references_location_seq'::regclass)" }, null: false
    t.text    "pages"
  end

  create_table "location_tags", force: :cascade do |t|
    t.integer "location_id"
    t.integer "tag_id"
  end

  create_table "locations", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.text     "kind"
    t.text     "address"
    t.text     "city"
    t.text     "country"
    t.text     "notes"
    t.datetime "updated_at"
  end

  create_table "occurrence_sources", id: :integer, default: -> { "nextval('occurrence_sources_id_seq1'::regclass)" }, force: :cascade do |t|
    t.integer "source_id"
    t.integer "occurrence_id"
    t.text    "pages"
  end

  create_table "occurrences", force: :cascade do |t|
    t.text     "details"
    t.date     "date"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.text     "name"
    t.text     "affiliation"
    t.text     "description"
    t.text     "notes"
    t.text     "metatype"
    t.text     "bluf"
    t.text     "active"
    t.datetime "updated_at"
  end

  create_table "person_sources", id: :integer, default: -> { "nextval('people_references_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "source_id", default: -> { "nextval('people_references_book_seq'::regclass)" },     null: false
    t.integer "person_id", default: -> { "nextval('people_references_referrer_seq'::regclass)" }, null: false
    t.text    "pages"
  end

  create_table "person_tags", id: :integer, default: -> { "nextval('people_tags_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "person_id"
    t.integer "tag_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.text "name"
  end

  create_table "sources", id: :integer, default: -> { "nextval('books_id_seq'::regclass)" }, force: :cascade do |t|
    t.text     "title"
    t.text     "sku"
    t.date     "publication_date"
    t.integer  "edition_id"
    t.text     "notes"
    t.boolean  "reviewed"
    t.boolean  "own"
    t.text     "isbn10"
    t.boolean  "pdfonly"
    t.text     "back_text"
    t.text     "author"
    t.integer  "publisher_id"
    t.text     "isbn13"
    t.date     "game_date"
    t.text     "image_addr"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.text "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_mask"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "event_tags", "events", name: "event_tags_event_id_fkey"
  add_foreign_key "event_tags", "tags", name: "event_tags_tag_id_fkey"
  add_foreign_key "group_members", "groups", name: "group_members_group_id_fkey"
  add_foreign_key "group_members", "people", name: "group_members_person_id_fkey"
  add_foreign_key "group_sources", "groups", name: "group_sources_group_fkey"
  add_foreign_key "group_sources", "sources", name: "group_sources_book_fkey"
  add_foreign_key "group_tags", "groups", name: "group_tags_group_id_fkey"
  add_foreign_key "group_tags", "tags", name: "group_tags_tag_id_fkey"
  add_foreign_key "incidents", "events", name: "incidents_event_id_fkey"
  add_foreign_key "incidents", "occurrences", name: "incidents_occurrence_id_fkey"
  add_foreign_key "location_sources", "locations", name: "location_references_location_fkey"
  add_foreign_key "location_sources", "sources", name: "location_references_book_fkey"
  add_foreign_key "location_tags", "locations", name: "location_tags_location_id_fkey"
  add_foreign_key "location_tags", "tags", name: "location_tags_tag_id_fkey"
  add_foreign_key "person_sources", "people", name: "people_references_referrer_fkey"
  add_foreign_key "person_sources", "sources", name: "people_references_book_fkey"
  add_foreign_key "person_tags", "people", name: "people_tags_person_id_fkey"
  add_foreign_key "person_tags", "tags", name: "people_tags_tag_id_fkey"
  add_foreign_key "sources", "editions", name: "books_edition_fkey"
  add_foreign_key "sources", "publishers", name: "sources_publisher_fkey"
end

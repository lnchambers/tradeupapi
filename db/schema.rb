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

ActiveRecord::Schema.define(version: 20180422233333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.bigint "zip_id"
    t.string "name"
    t.string "location"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zip_id"], name: "index_businesses_on_zip_id"
  end

  create_table "catalogs", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "program_id"
    t.index ["institution_id"], name: "index_catalogs_on_institution_id"
    t.index ["program_id"], name: "index_catalogs_on_program_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.integer "population_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "program_id"
    t.integer "year"
    t.integer "max_age"
    t.integer "min_age"
    t.string "gender"
    t.string "ethnicity"
    t.integer "residency"
    t.string "degree_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_enrollments_on_institution_id"
    t.index ["program_id"], name: "index_enrollments_on_program_id"
  end

  create_table "graduations", force: :cascade do |t|
    t.bigint "institution_id"
    t.bigint "program_id"
    t.integer "year"
    t.integer "max_age"
    t.integer "min_age"
    t.string "gender"
    t.string "ethnicity"
    t.integer "residency"
    t.string "degree_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_graduations_on_institution_id"
    t.index ["program_id"], name: "index_graduations_on_program_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.integer "type_of_institution"
    t.integer "tax_type"
    t.string "address"
    t.string "contact_person"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "msas", force: :cascade do |t|
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uas", force: :cascade do |t|
    t.bigint "zip_id"
    t.bigint "msa_id"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["msa_id"], name: "index_uas_on_msa_id"
    t.index ["zip_id"], name: "index_uas_on_zip_id"
  end

  create_table "zips", force: :cascade do |t|
    t.integer "code"
    t.bigint "county_id"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ua"
    t.index ["county_id"], name: "index_zips_on_county_id"
  end

  add_foreign_key "businesses", "zips"
  add_foreign_key "catalogs", "institutions"
  add_foreign_key "catalogs", "programs"
  add_foreign_key "enrollments", "institutions"
  add_foreign_key "enrollments", "programs"
  add_foreign_key "graduations", "institutions"
  add_foreign_key "graduations", "programs"
  add_foreign_key "uas", "msas"
  add_foreign_key "uas", "zips"
  add_foreign_key "zips", "counties"
end

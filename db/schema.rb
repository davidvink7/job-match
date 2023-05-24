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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_085406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "required_skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobseekers", force: :cascade do |t|
    t.string "name"
    t.text "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", id: false, force: :cascade do |t|
    t.text "skills"
  end

  create_table "test_table", id: false, force: :cascade do |t|
    t.bigint "jobseeker_id"
    t.string "jobseeker_name"
    t.bigint "job_id"
    t.string "job_title"
    t.text "jobseeker_skills"
    t.text "required_skills"
  end

  create_table "x_a", id: false, force: :cascade do |t|
    t.integer "id1"
    t.text "shared"
  end

  create_table "x_b", id: false, force: :cascade do |t|
    t.integer "id1"
    t.text "shared"
  end

end

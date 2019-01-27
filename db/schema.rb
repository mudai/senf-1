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

ActiveRecord::Schema.define(version: 2019_01_27_110510) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "numbers", force: :cascade do |t|
    t.integer "senf_file_id"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["senf_file_id"], name: "index_numbers_on_senf_file_id"
    t.index [nil], name: "index_numbers_on_senf_file"
  end

  create_table "senf_files", force: :cascade do |t|
    t.string "runner"
    t.string "path"
    t.string "file_name"
    t.string "extension"
    t.integer "size"
    t.boolean "exist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exist"], name: "index_senf_files_on_exist"
    t.index ["runner"], name: "index_senf_files_on_runner"
  end

end

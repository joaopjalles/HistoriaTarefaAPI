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

ActiveRecord::Schema[8.0].define(version: 2025_02_18_165334) do
  create_table "historia", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.boolean "finalizada"
    t.integer "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_historia_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarefas", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.boolean "finalizada"
    t.integer "historia_id", null: false
    t.integer "status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["historia_id"], name: "index_tarefas_on_historia_id"
    t.index ["status_id"], name: "index_tarefas_on_status_id"
  end

  add_foreign_key "historia", "statuses"
  add_foreign_key "tarefas", "historia", column: "historia_id"
  add_foreign_key "tarefas", "statuses"
end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131104145351) do

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto",                      null: false
    t.boolean  "correcta",   default: false
  end

  create_table "courses", force: true do |t|
    t.string   "nivel"
    t.integer  "numero"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto",          null: false
    t.float    "puntaje_maximo", null: false
  end

  create_table "rols", force: true do |t|
    t.string   "nombre",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rols", ["nombre"], name: "index_rols_on_nombre", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",            null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "nombres"
    t.string   "apellidos"
    t.date     "fecha_nacimiento"
    t.string   "identificacion"
    t.string   "tipo_identificacion"
    t.string   "direccion"
    t.string   "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["identificacion"], name: "index_users_on_identificacion", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end

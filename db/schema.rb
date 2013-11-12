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

ActiveRecord::Schema.define(version: 20131112171655) do

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto",                       null: false
    t.boolean  "correcta",    default: false
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "courses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre",     null: false
  end

  add_index "courses", ["nombre"], name: "index_courses_on_nombre", unique: true, using: :btree

  create_table "evaluacions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.integer  "course_id"
  end

  create_table "questions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto",          null: false
    t.float    "puntaje_maximo", null: false
    t.integer  "evaluacion_id"
    t.string   "kind"
    t.string   "section"
  end

  add_index "questions", ["evaluacion_id"], name: "index_questions_on_evaluacion_id", using: :btree

  create_table "rols", force: true do |t|
    t.string   "nombre",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rols", ["nombre"], name: "index_rols_on_nombre", unique: true, using: :btree

  create_table "user_rols", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "rol_id",     null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_rols", ["course_id", "rol_id"], name: "index_user_rols_on_course_id_and_rol_id", using: :btree
  add_index "user_rols", ["course_id"], name: "index_user_rols_on_course_id", using: :btree
  add_index "user_rols", ["rol_id"], name: "index_user_rols_on_rol_id", using: :btree
  add_index "user_rols", ["user_id", "course_id"], name: "index_user_rols_on_user_id_and_course_id", using: :btree
  add_index "user_rols", ["user_id", "rol_id", "course_id"], name: "index_user_rols_on_user_id_and_rol_id_and_course_id", unique: true, using: :btree
  add_index "user_rols", ["user_id", "rol_id"], name: "index_user_rols_on_user_id_and_rol_id", using: :btree
  add_index "user_rols", ["user_id"], name: "index_user_rols_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                            null: false
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
    t.boolean  "admin",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["identificacion"], name: "index_users_on_identificacion", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "usuario_pregunta", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuario_pregunta", ["question_id"], name: "index_usuario_pregunta_on_question_id", using: :btree
  add_index "usuario_pregunta", ["user_id"], name: "index_usuario_pregunta_on_user_id", using: :btree

  create_table "usuario_respuesta", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuario_respuesta", ["answer_id"], name: "index_usuario_respuesta_on_answer_id", using: :btree
  add_index "usuario_respuesta", ["question_id"], name: "index_usuario_respuesta_on_question_id", using: :btree
  add_index "usuario_respuesta", ["user_id"], name: "index_usuario_respuesta_on_user_id", using: :btree

end

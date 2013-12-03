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

ActiveRecord::Schema.define(version: 20131203162131) do

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto",                       null: false
    t.boolean  "correcta",    default: false
    t.integer  "question_id"
    t.string   "opcion"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "courses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre",     null: false
  end

  add_index "courses", ["nombre"], name: "index_courses_on_nombre", unique: true, using: :btree

  create_table "evaluacion_formatos", force: true do |t|
    t.integer "course_id", null: false
    t.text    "formato"
  end

  add_index "evaluacion_formatos", ["course_id"], name: "index_evaluacion_formatos_on_course_id", using: :btree

  create_table "evaluacions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.integer  "course_id"
    t.datetime "available_from"
    t.datetime "available_to"
  end

  create_table "questions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto",          null: false
    t.float    "puntaje_maximo", null: false
    t.string   "kind"
    t.string   "section"
    t.boolean  "bool_answer"
    t.string   "media"
    t.integer  "seccion_id"
  end

  add_index "questions", ["kind"], name: "index_questions_on_kind", using: :btree
  add_index "questions", ["seccion_id"], name: "index_questions_on_seccion_id", using: :btree

  create_table "rols", force: true do |t|
    t.string   "nombre",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rols", ["nombre"], name: "index_rols_on_nombre", unique: true, using: :btree

  create_table "secciones", force: true do |t|
    t.string   "tipo"
    t.string   "instruccion"
    t.integer  "evaluacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "media"
  end

  add_index "secciones", ["evaluacion_id"], name: "index_secciones_on_evaluacion_id", using: :btree

  create_table "user_answers", force: true do |t|
    t.integer  "question_id",          null: false
    t.integer  "answer_id"
    t.integer  "user_id",              null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "written_answer_grade"
  end

  add_index "user_answers", ["answer_id"], name: "index_user_answers_on_answer_id", using: :btree
  add_index "user_answers", ["question_id", "answer_id", "user_id"], name: "index_user_answers_on_question_id_and_answer_id_and_user_id", using: :btree
  add_index "user_answers", ["question_id", "user_id"], name: "index_user_answers_on_question_id_and_user_id", using: :btree
  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

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

end

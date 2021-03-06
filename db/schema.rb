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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110817000443) do

  create_table "cartas", :force => true do |t|
    t.integer  "wocid"
    t.integer  "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coleccion_id"
  end

  create_table "colecciones", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coleccionista_id"
  end

  create_table "coleccionistas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coleccionistas_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "coleccionista_id"
  end

  create_table "mazos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ubicaciones", :force => true do |t|
    t.integer  "cantidad"
    t.string   "observaciones"
    t.integer  "carta_id"
    t.integer  "mazo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ubicaciones", ["carta_id", "mazo_id"], :name => "index_ubicaciones_on_carta_id_and_mazo_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombre",                 :limit => 50
    t.string   "apellido",               :limit => 50
    t.boolean  "approved",                              :default => false
    t.boolean  "rejected",                              :default => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

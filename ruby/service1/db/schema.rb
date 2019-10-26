# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "clients", primary_key: "idClients", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "identification", null: false
    t.string "name", limit: 45, null: false
    t.string "lastName", limit: 45, null: false
    t.string "address", limit: 45
    t.string "email", limit: 45
    t.integer "phoneNumber", null: false
    t.integer "idProvinces", null: false
    t.index ["idProvinces"], name: "fk_clients_provinces1_idx"
  end

  create_table "countries", primary_key: "idCountries", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 45, null: false
  end

  create_table "orders", primary_key: "idOrders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.datetime "orderDate", null: false
    t.string "details", limit: 45
    t.integer "idRestaurants", null: false
  end

  create_table "provinces", primary_key: "idProvinces", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "idCountries", null: false
    t.index ["idCountries"], name: "fk_provinces_countries1_idx"
  end

  create_table "restaurants", primary_key: "idRestaurants", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "address", limit: 45
    t.integer "idProvinces", null: false
    t.index ["idProvinces"], name: "fk_restaurants_provinces1_idx"
  end

  create_table "restaurantsXorders", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idRestaurants", null: false
    t.integer "idOrders", null: false
    t.index ["idOrders"], name: "fk_restaurantsXorders_orders1_idx"
    t.index ["idRestaurants"], name: "fk_restaurantsXorders_restaurants1_idx"
  end

  create_table "users", primary_key: "idUsers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "userName", limit: 45, null: false
    t.string "password", limit: 45, null: false
    t.integer "idClients", null: false
    t.index ["idClients"], name: "fk_users_clients_idx"
  end

  create_table "usersXorders", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "idUsers", null: false
    t.integer "idOrders", null: false
    t.index ["idOrders"], name: "fk_usersXorders_orders1_idx"
    t.index ["idUsers"], name: "fk_usersXorders_users1_idx"
  end

  add_foreign_key "clients", "provinces", column: "idProvinces", primary_key: "idProvinces", name: "fk_clients_provinces1"
  add_foreign_key "provinces", "countries", column: "idCountries", primary_key: "idCountries", name: "fk_provinces_countries1"
  add_foreign_key "restaurants", "provinces", column: "idProvinces", primary_key: "idProvinces", name: "fk_restaurants_provinces1"
  add_foreign_key "restaurantsXorders", "orders", column: "idOrders", primary_key: "idOrders", name: "fk_restaurantsXorders_orders1"
  add_foreign_key "restaurantsXorders", "restaurants", column: "idRestaurants", primary_key: "idRestaurants", name: "fk_restaurantsXorders_restaurants1"
  add_foreign_key "users", "clients", column: "idClients", primary_key: "idClients", name: "fk_users_clients"
  add_foreign_key "usersXorders", "orders", column: "idOrders", primary_key: "idOrders", name: "fk_usersXorders_orders1"
  add_foreign_key "usersXorders", "users", column: "idUsers", primary_key: "idUsers", name: "fk_usersXorders_users1"
end

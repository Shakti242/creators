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

ActiveRecord::Schema[8.1].define(version: 2025_04_04_031341) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.boolean "charges_enabled"
    t.datetime "created_at", null: false
    t.string "external_account_id"
    t.string "financial_account_id"
    t.boolean "payouts_enabled"
    t.string "stripe_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attachment_views", force: :cascade do |t|
    t.bigint "attachment_id", null: false
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_attachment_views_on_attachment_id"
    t.index ["customer_id"], name: "index_attachment_views_on_customer_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "product_id", null: false
    t.datetime "updated_at", null: false
    t.integer "views_count"
    t.index ["product_id"], name: "index_attachments_on_product_id"
  end

  create_table "customer_products", force: :cascade do |t|
    t.string "checkout_session_id"
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "product_id", "checkout_session_id"], name: "idx_on_customer_id_product_id_checkout_session_id_28f7393e38", unique: true
    t.index ["customer_id"], name: "index_customer_products_on_customer_id"
    t.index ["product_id"], name: "index_customer_products_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "session_token"
    t.bigint "store_id", null: false
    t.string "stripe_id"
    t.datetime "token_expires_at"
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_customers_on_store_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "data"
    t.text "processing_errors"
    t.string "source"
    t.integer "status"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "data"
    t.string "description"
    t.string "name", null: false
    t.string "photo"
    t.string "stripe_id"
    t.string "stripe_price_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.string "domain"
    t.string "name"
    t.string "primary_color"
    t.string "secondary_color"
    t.string "subdomain"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["account_id"], name: "index_stores_on_account_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attachment_views", "attachments"
  add_foreign_key "attachment_views", "customers"
  add_foreign_key "attachments", "products"
  add_foreign_key "customer_products", "customers"
  add_foreign_key "customer_products", "products"
  add_foreign_key "customers", "stores"
  add_foreign_key "products", "users"
  add_foreign_key "stores", "users"
end

class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table "active_storage_attachments" do |t|
      t.string "name", null: false
      t.string "record_type", null: false
      t.integer "record_id", null: false
      t.integer "blob_id", null: false
      t.datetime "created_at", null: false
      t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
      t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    end
    create_table "active_storage_blobs" do |t|
      t.string "key", null: false
      t.string "filename", null: false
      t.string "content_type"
      t.text "metadata"
      t.bigint "byte_size", null: false
      t.string "checksum", null: false
      t.datetime "created_at", null: false
      t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    end
    create_table "tasks" do |t|
      t.string "name", null: false
      t.text "description"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "user_id"
      t.index ["user_id"], name: "index_tasks_on_user_id"
    end
    create_table "users" do |t|
      t.string "name", null: false
      t.string "email", null: false
      t.string "password_digest", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "admin", default: false, null: false
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end

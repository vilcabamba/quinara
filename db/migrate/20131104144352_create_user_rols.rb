class CreateUserRols < ActiveRecord::Migration
  def change
    create_table :user_rols do |t|
      t.references :user, null: false
      t.references :rol, null: false
      t.references :course, null: false

      t.timestamps
    end
    add_index :user_rols, [:user_id, :rol_id, :course_id], unique: true
  end
end

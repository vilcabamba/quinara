class AddExtraIndexesToUserRols < ActiveRecord::Migration
  def change
    add_index :user_rols, [:user_id, :course_id]
    add_index :user_rols, [:course_id, :rol_id]
    add_index :user_rols, :user_id
    add_index :user_rols, :rol_id
    add_index :user_rols, :course_id
  end
end

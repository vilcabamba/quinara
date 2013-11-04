class AddExtraIndexToUserRols < ActiveRecord::Migration
  def change
    add_index :user_rols, [:user_id, :rol_id]
  end
end

class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|

      t.string :nombre, null: false

      t.timestamps
    end
    add_index :rols, :nombre, unique: true
  end
end

class CambiarEstructuraDeCursos < ActiveRecord::Migration
  def up
    Course.find_each do |course|
      course.destroy
    end
    change_table :courses do |t|
      t.remove :nivel, :numero
      t.string :nombre, null: false
    end
    add_index :courses, :nombre, unique: true
  end
  def down
    remove_index :courses, :nombre
    change_table :courses do |t|
      t.string :nivel
      t.integer :numero
      t.remove :nombre
    end
  end
end

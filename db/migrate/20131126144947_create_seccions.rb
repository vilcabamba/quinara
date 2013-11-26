class CreateSeccions < ActiveRecord::Migration
  def change
    create_table :secciones do |t|
      t.string :tipo
      t.string :instruccion
      t.integer :evaluacion_id
      t.timestamps
    end
    add_index :secciones, :evaluacion_id
  end
end

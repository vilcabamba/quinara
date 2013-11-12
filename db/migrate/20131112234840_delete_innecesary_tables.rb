class DeleteInnecesaryTables < ActiveRecord::Migration
  def up
    drop_table :usuario_pregunta
    drop_table :usuario_respuesta
  end
  def down
    raise "irreversible migration!"
  end
end

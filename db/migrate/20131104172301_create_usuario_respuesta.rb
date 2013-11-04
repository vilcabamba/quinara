class CreateUsuarioRespuesta < ActiveRecord::Migration
  def change
    create_table :usuario_respuesta do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end

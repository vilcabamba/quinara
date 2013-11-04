class CreateUsuarioPregunta < ActiveRecord::Migration
  def change
    create_table :usuario_pregunta do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.timestamps
    end
  end
end

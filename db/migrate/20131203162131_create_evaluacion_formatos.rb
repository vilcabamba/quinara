class CreateEvaluacionFormatos < ActiveRecord::Migration
  def change
    create_table :evaluacion_formatos do |t|
      t.references :course, null: false
      t.text :formato
    end
    add_index :evaluacion_formatos, :course_id
  end
end

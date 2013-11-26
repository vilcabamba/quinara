class ChangeFieldsForSeccion < ActiveRecord::Migration
  def up
    add_column :questions, :seccion_id, :integer
    add_index :questions, :seccion_id

    Question.connection.schema_cache.clear!
    Question.reset_column_information
    Question.find_each do |question|
      if question.valid?
        Seccion.create!(tipo: question.section,
                        instruccion: question.texto,
                        evaluacion_id: question.evaluacion_id).tap do |seccion|
          question.update! seccion_id: seccion.id
        end
      end
    end

    remove_index :questions, :evaluacion_id
    remove_column :questions, :evaluacion_id
  end
  def down
    remove_index :questions, :seccion_id
    remove_column :questions, :seccion_id

    add_column :questions, :evaluacion_id, :integer
    add_index :questions, :evaluacion_id
  end
end

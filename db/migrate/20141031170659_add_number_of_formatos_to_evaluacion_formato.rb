class AddNumberOfFormatosToEvaluacionFormato < ActiveRecord::Migration
  def change
    add_column :evaluacion_formatos, :formatos_count, :integer, default: 3
  end
end

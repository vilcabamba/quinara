class AddEvaluacionIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :evaluacion_id, :integer
    add_index :questions, :evaluacion_id
  end
end

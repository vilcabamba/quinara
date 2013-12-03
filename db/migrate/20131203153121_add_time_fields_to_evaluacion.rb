class AddTimeFieldsToEvaluacion < ActiveRecord::Migration
  def change
    add_column :evaluacions, :available_from, :datetime
    add_column :evaluacions, :available_to,   :datetime
  end
end

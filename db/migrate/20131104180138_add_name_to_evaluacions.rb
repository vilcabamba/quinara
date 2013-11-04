class AddNameToEvaluacions < ActiveRecord::Migration
  def change
    add_column :evaluacions, :nombre, :string, :nil => false
  end
end

class CreateEvaluacions < ActiveRecord::Migration
  def change
    create_table :evaluacions do |t|

      t.timestamps
    end
  end
end

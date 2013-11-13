class AddTrueOrFalseToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :bool_answer, :boolean
    add_column :questions, :written_answer_correct, :text
  end
end

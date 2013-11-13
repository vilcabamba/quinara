class AddTrueOrFalseToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :bool_answer, :boolean
    add_column :user_answers, :written_answer_grade, :text
  end
end

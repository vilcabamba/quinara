class AddScoreToUserAnswers < ActiveRecord::Migration
  def change
    add_column :user_answers, :written_answer_score, :float
  end
end

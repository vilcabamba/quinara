class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.references :question, null: false
      t.references :answer
      t.references :user, null: false
      t.text :content
      t.timestamps
    end
    add_index :user_answers, :question_id
    add_index :user_answers, :answer_id
    add_index :user_answers, :user_id
    add_index :user_answers, [:question_id, :user_id]
    add_index :user_answers, [:question_id, :answer_id, :user_id]
  end
end

class AddIndexToQuestions < ActiveRecord::Migration
  def change
    add_index :questions, :kind
  end
end

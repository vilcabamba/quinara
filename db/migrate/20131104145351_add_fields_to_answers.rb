class AddFieldsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :texto, :string, :null => false
    add_column :answers, :correcta, :boolean, :default => false
  end
end

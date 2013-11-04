class AddFieldsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :texto, :string, :null => false
    add_column :questions, :puntaje_maximo, :float, :null => false
  end
end

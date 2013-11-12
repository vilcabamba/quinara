class AddMissingFieldsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :kind, :string
    add_column :questions, :section, :string
  end
end

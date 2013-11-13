class AddMediaToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :media, :string
  end
end

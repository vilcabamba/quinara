class AddOpcionToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :opcion, :string
  end
end

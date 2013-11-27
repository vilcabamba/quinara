class AddMediaToSeccion < ActiveRecord::Migration
  def change
    add_column :secciones, :media, :string
  end
end

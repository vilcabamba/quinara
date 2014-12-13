class ModificarCamposUsuario < ActiveRecord::Migration
  def change
    rename_column :users, :apellidos, :apellido_paterno
    add_column :users, :apellido_materno, :string
  end
end

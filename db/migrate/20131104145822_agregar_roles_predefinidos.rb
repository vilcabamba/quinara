class AgregarRolesPredefinidos < ActiveRecord::Migration
  def up
    %w(docente alumno).each do |nombre|
      Rol.create! nombre: nombre
    end
  end
  def down
    Rol.all.each do |rol|
      rol.destroy
    end
  end
end

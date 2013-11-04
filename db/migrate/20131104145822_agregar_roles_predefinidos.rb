class AgregarRolesPredefinidos < ActiveRecord::Migration
  def up
    %w(Docente Alumno).each do |nombre|
      Rol.create! nombre: nombre
    end
  end
  def down
    Rol.all.each do |rol|
      rol.destroy
    end
  end
end

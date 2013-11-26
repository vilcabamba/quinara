class Seccion < ActiveRecord::Base
  self.table_name = :secciones

  belongs_to :evaluacion
  has_many :questions

end

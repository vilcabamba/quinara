class Seccion < ActiveRecord::Base
  include SeccionKinds
  self.table_name = :secciones

  belongs_to :evaluacion
  has_many :questions

end

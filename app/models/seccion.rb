class Seccion < ActiveRecord::Base
  include SeccionKinds
  self.table_name = :secciones

# relationships
  belongs_to :evaluacion
  has_many :questions

# nested attributes
  accepts_nested_attributes_for :questions, allow_destroy: true

end

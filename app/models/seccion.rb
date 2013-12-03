class Seccion < ActiveRecord::Base
  include SeccionKinds
  include EvaluacionMediaFiles

# table name
  self.table_name = :secciones

# relationships
  belongs_to :evaluacion
  has_many :questions

# uploaders
  mount_uploader :media, QuestionMediaUploader

# nested attributes
  accepts_nested_attributes_for :questions, allow_destroy: true

# methods
  def puntaje
    puntaje = 0
    questions.each do |question|
      puntaje += question.puntaje_maximo
    end
    puntaje
  end

end

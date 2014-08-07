# == Schema Information
#
# Table name: secciones
#
#  id            :integer          not null, primary key
#  tipo          :string(255)
#  instruccion   :string(255)
#  evaluacion_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  media         :string(255)
#

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
    questions.inject(0.0) {|sum, question| sum + question.puntaje_maximo.to_f }
  end

end

# == Schema Information
#
# Table name: rols
#
#  id         :integer          not null, primary key
#  nombre     :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Rol < ActiveRecord::Base

# validations
  validates :nombre, presence: true, uniqueness: true

# relationships
  has_many :user_rols, dependent: :destroy
  has_many :users, through: :user_rols

# class methods:
  def self.docente
    @@docente ||= find_by nombre: "Docente"
  end
  def self.alumno
    @@alumno ||= find_by nombre: "Alumno"
  end

end

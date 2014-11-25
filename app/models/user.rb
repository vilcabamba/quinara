# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)      not null
#  email               :string(255)
#  crypted_password    :string(255)
#  salt                :string(255)
#  nombres             :string(255)
#  apellidos           :string(255)
#  fecha_nacimiento    :date
#  identificacion      :string(255)
#  tipo_identificacion :string(255)
#  direccion           :string(255)
#  telefono            :string(255)
#  admin               :boolean          default(FALSE)
#  created_at          :datetime
#  updated_at          :datetime
#  imagen              :string(255)
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include UserCourses
  include UserIdValidator
  include UserAdvises
  include UserEvaluaciones

# scopes:
  default_scope { order(:apellidos, :nombres, :username) }

# attrs:
  attr_accessor :password_confirmation

# uploaders:
  mount_uploader :imagen, UserImagenUploader

# validations:
  validates :username, presence: true, :uniqueness =>  { :case_sensitive => false }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validate :password_confirmation_matches
  validates :identificacion, :uniqueness => { :allow_blank => true }

# relationships:
  has_many :user_rols
  has_many :rols, through: :user_rols
  has_many :courses, through: :user_rols
  has_many :all_evaluaciones, through: :courses, source: :evaluaciones
  has_many :user_answers

# methods:
  def password_confirmation_matches
    errors.add(:password, "Confirmación no coincide") unless password == password_confirmation
  end
  def nombres_completos
    "#{nombres} #{apellidos}"
  end
  def info_for_select
    "#{nombres_completos} (#{username})"
  end
  def nombres_o_username
    nombres.blank? ? username : nombres
  end

# class methods
  def self.users_for_select
    select(:id, :nombres, :apellidos, :username).map {|u| [u.info_for_select, u.id] }
  end

end

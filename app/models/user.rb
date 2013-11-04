class User < ActiveRecord::Base
  authenticates_with_sorcery!
  include UserCourses

# attrs:
  attr_accessor :password_confirmation

# uploaders:
  mount_uploader :imagen, UserImagenUploader

# validations:
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validate :password_confirmation_matches

# relationships:
  has_many :user_rols
  has_many :rols, through: :user_rols
  has_many :courses, through: :user_rols

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
    select(:id, :nombres, :apellidos, :username).order(:apellidos, :nombres, :username).map {|u| [u.info_for_select, u.id] }
  end

end

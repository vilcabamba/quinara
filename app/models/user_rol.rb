class UserRol < ActiveRecord::Base

# relationships
  belongs_to :user
  belongs_to :rol
  belongs_to :course

# validations
  validates :user_id, presence: true
  validates :rol_id, presence: true
  validates :course_id, presence: true
  validate :permission_doesnt_exist

# methods
  def permission_doesnt_exist
    errors.add(:base, "Ese permiso ya existe") if self.class.exists? user_id: user_id, rol_id: rol_id, course_id: course_id
  end

end

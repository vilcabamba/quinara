class Rol < ActiveRecord::Base

  validates :nombre, presence: true, uniquness: true

end

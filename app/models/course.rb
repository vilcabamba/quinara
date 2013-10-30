class Course < ActiveRecord::Base
  validates :numero, :nivel, presence: true
end

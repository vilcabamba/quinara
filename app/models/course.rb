class Course < ActiveRecord::Base

# validations:
  validates :numero, :nivel, presence: true

# relationships:
  has_many :user_rols
  has_many :users, through: :user_rols

end

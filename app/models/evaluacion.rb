class Evaluacion < ActiveRecord::Base
# relationships
  belongs_to :course
  has_many :questions

# validations
  validates :nombre, presence: true

# nested attributes
  accepts_nested_attributes_for :questions
end

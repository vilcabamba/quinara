class Question < ActiveRecord::Base
  #relationships
  has_many :answers
end

class UserAnswer < ActiveRecord::Base

# relations
  belongs_to :user
  belongs_to :answer
  belongs_to :question

end

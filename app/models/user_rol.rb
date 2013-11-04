class UserRol < ActiveRecord::Base

# relationships:
  belongs_to :user
  belongs_to :rol

end

# == Schema Information
#
# Table name: user_rols
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  rol_id     :integer          not null
#  course_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe UserRol do
  pending "add some examples to (or delete) #{__FILE__}"
end

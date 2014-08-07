# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  texto       :string(255)      not null
#  correcta    :boolean          default(FALSE)
#  question_id :integer
#  opcion      :string(255)
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end

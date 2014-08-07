# == Schema Information
#
# Table name: evaluacions
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  nombre         :string(255)
#  course_id      :integer
#  available_from :datetime
#  available_to   :datetime
#

require 'spec_helper'

describe Evaluacion do
  pending "add some examples to (or delete) #{__FILE__}"
end

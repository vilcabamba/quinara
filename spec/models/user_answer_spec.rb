# == Schema Information
#
# Table name: user_answers
#
#  id                   :integer          not null, primary key
#  question_id          :integer          not null
#  answer_id            :integer
#  user_id              :integer          not null
#  content              :text
#  created_at           :datetime
#  updated_at           :datetime
#  written_answer_grade :text
#

require 'spec_helper'

describe UserAnswer do
  pending "add some examples to (or delete) #{__FILE__}"
end

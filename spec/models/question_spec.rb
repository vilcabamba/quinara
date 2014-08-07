# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  texto          :string(255)      not null
#  puntaje_maximo :float            not null
#  kind           :string(255)
#  section        :string(255)
#  bool_answer    :boolean
#  media          :string(255)
#  seccion_id     :integer
#

require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end

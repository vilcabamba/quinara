# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)      not null
#  email               :string(255)
#  crypted_password    :string(255)
#  salt                :string(255)
#  nombres             :string(255)
#  apellidos           :string(255)
#  fecha_nacimiento    :date
#  identificacion      :string(255)
#  tipo_identificacion :string(255)
#  direccion           :string(255)
#  telefono            :string(255)
#  admin               :boolean          default(FALSE)
#  created_at          :datetime
#  updated_at          :datetime
#  imagen              :string(255)
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end

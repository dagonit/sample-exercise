class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :social_security_number

  validates_length_of :social_security_number, minimum: 9, maximum: 9
end

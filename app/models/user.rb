class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :social_security_number
end

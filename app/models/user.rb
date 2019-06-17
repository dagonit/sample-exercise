class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :social_security_number, presence: true, length: {is: 9}
end

class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :social_security_number
  # Regex to validate email is in format aaa@bbb.ccc
  validates_format_of :email, :with => /.+@.+\..+/i
  # Regex to validate social security number is in format 0000000000 or 000-00-0000
  validates_format_of :social_security_number, :with => /(\d{3}-\d{2}-\d{4}|\A'\d{9}'\z)/

end

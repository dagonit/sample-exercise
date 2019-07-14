class User < ApplicationRecord
  # Regex to validate email is in format aaa@bbb.ccc
  validates_format_of :email, :with => /.+@.+\..+/i
  # Regex to validate social security number is in format 0000000000 or 000-00-0000
  validates_format_of :social_security_number, :with => /\d{9}|\d{2}-\d{3}-\d{4}/
end

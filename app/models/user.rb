class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :social_security_number
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates_format_of :social_security_number, 
                      with: ->(user) {
                        if user.social_security_number && user.social_security_number.length == 9
                          /\d{9}/
                        else
                          /\d{3}-\d{2}-\d{4}/
                        end
                        }
end
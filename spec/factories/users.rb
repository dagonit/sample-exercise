FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    encrypted_ssn { "MyString" }
    encrypted_ssn_iv { "MyString" }
    email { "MyString" }
  end
end

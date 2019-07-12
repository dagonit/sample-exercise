FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "Test FirstName #{n}" }
    sequence(:last_name) { |n| "Test LasttName #{n}" }
    sequence(:email) {|n| "user_#{n}@gmail.com"}
    sequence(:encrypted_ssn) { |n| "encrypted_ssn#{n}" }
    sequence(:encrypted_ssn_iv) { "Ebcby9ymSRuMehXP\n"}
  end
end

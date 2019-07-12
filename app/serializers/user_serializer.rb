class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :encrypted_ssn, :encrypted_ssn_iv
end

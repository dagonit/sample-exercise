class ApplicationController < ActionController::API

  def invalid_credentials
    { error: "Invalid credentials." }
  end

  def credentials_conflict
    { error: "User could not be saved with those credentials." }
  end

end

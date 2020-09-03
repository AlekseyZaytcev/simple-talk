# frozen_string_literal: true

class UserRepository < Hanami::Repository
  def by_email(email)
    users.where(email: email).first
  end

  def email_exists?(email)
    !!by_email(email)
  end
end

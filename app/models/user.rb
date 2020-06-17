class User < ActiveRecord::Base
  has_secure_password
  # `password=` takes in a password, generates a salt, sends through a hashing algo, sets pw to result
  # `authenticate` uses the first part of password_digest (the salt), combines with the user-inputted string, matches
  # validates the presence of a password
  # if you include a pw confirmation param, it will validate for you **
  # can generate a recovery pw **
end


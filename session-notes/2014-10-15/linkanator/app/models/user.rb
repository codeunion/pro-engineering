class User < ActiveRecord::Base
  has_secure_password

  has_many :links

  validates :email,
    presence:   true,
    uniqueness: true

  validates :username,
    presence:   true,
    uniqueness: true,
    length:     { in: 3..20 }
end

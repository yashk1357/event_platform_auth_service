class User < ApplicationRecord
    has_secure_password
  
    enum :role, { user: 0, admin: 1, organizer: 2 }, suffix: true
  
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, on: :create
  end
  
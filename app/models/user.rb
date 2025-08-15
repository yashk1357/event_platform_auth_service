class User < ApplicationRecord
    has_secure_password

    enum: { user: 0, admin: 1, organizer: 2}

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, only: :create
end

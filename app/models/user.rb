class User < ApplicationRecord
    has_secure_password
    has_many :notes
    validates :username, presence: true
    validates :username, uniqueness: true
end

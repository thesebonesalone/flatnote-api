class User < ApplicationRecord
    has_many :notes
    validates :username, presence: true
    validates :username, uniqueness: true
end

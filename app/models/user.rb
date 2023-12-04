class User < ApplicationRecord
    has_many :recordattend
    has_secure_password
end

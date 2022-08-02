class User < ApplicationRecord
  has_many :records
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :user_name, presence: true, length: {minimum: 4, maximum: 16}
  
  has_many :posts
end

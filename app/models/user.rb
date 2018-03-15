class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable

    validate :validate_username
    validates :user_name, presence: true, length: {minimum: 4, maximum: 16}
    
    has_many :posts, dependent: :destroy

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    acts_as_voter

    has_many :notifications, dependent: :destroy

    def current_avatar
        return avatar.url(:medium) if avatar.exists?

        'default-avatar.jpg'
    end

    def validate_username
        if user_name.match(/\s+/)
            errors.add(:user_name, "No spaces on the username!") 
        elsif user_name.in? ['post', 'posts', 'new', 'edit', 'show']
            errors.add(:user_name, "That username is invalid!")
        end  
    end

end

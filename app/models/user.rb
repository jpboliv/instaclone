class User < ApplicationRecord
  include PgSearch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :validate_username
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  has_many :posts, dependent: :destroy

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  acts_as_voter

  has_many :notifications, dependent: :destroy

  pg_search_scope :search_user, against: %i[user_name email], using: {
    tsearch: { prefix: true }
  }

  def current_avatar
    return avatar.url(:medium) if avatar.exists?

    'default-avatar.jpg'
  end

  def validate_username
    errors.add(:user_name, 'No spaces on the username!') if user_name =~ /\s+/
  end
end

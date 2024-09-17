class User < ApplicationRecord
  # lowercase email before save to database
  before_save { self.email = email.downcase }

  # The dependent: :destroy option specifies that when a user is deleted, all associated articles should also be deleted
  has_many :articles, dependent: :destroy

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: EMAIL_REGEX }
end

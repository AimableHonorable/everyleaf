class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :firstname , presence:true
  validates :lastname , presence:true
  validates :email , presence:true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.admin
    @users = User.all
    @admins = 0
    @users.each do |user|
      if user.admin?
        @admins += 1
      end
    end
    return @admins
  end
end

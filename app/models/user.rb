class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates_presence_of :email, uniqueness: true

  has_many :assignments
  has_many :tasks, through: :assignments

  def assignments_completed
    User.joins(:assignment).where(status: true).order('id DESC')
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end
 end

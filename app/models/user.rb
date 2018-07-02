class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  #validates_presence_of :username
  validates_presence_of :email, uniqueness: true

  has_many :assignments
  has_many :tasks, through: :assignments

  #def complete_assignments
  #  self.assignments.select {|assignment| assignment.status == 'complete'}
#  end

#  def incomplete_assignments
  #  self.assignments.select {|assignment| assignment.status == 'incomplete'}
#  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end

end#

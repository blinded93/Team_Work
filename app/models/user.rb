class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates_presence_of :name
  validates_presence_of :email, uniqueness: true

  has_many :assignments
  has_many :tasks, through: :assignments

  def completed_assignments
    self.assignments.select {|assignment| assignment.status == 'complete'}
  end

  def pending_assignments
    self.assignments.select {|assignment| assignment.status == 'pending'}
  end

end#

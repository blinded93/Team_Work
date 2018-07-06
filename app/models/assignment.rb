class Assignment < ApplicationRecord
  has_many :tasks
  has_many :user_assignments
  has_many :users, through: :user_assignments



  validates_presence_of :name
  validates_presence_of :due_date


  def self.incomplete
    where(status: false).order('id DESC')
  end

  def self.complete
    where(status: true).order('id DESC')
  end
end

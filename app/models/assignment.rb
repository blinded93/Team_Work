class Assignment < ApplicationRecord
  has_many :tasks
  has_many :users, through: :tasks

  validates_presence_of :name
  validates_presence_of :due_date

  def self.incomplete
    where(status: false).order('id DESC')
  end

  def self.complete
    where(status: true).order('id DESC')
  end
end

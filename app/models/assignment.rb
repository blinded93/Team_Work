class Assignment < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :due_date


  def self.incomplete
    where(status: false).order('id DESC')
  end

  def self.complete
    where(status: true).order('id DESC')
  end
end

class Assignment < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates_presence_of :name
  validates_presence_of :due_date


  def self.complete
    where(status: true).order('id DESC')
  end

  def self.incomplete
    where(status: false).order('id DESC')
  end
end

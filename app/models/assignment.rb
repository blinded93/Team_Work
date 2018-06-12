class Assignment < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates_presence_of :title

  scope :completed, -> { where(status: 'completed') }
  scope :pending, -> { where(status: 'pending') }


  def pending?
    status == 'pending'
  end

  def completed?
    status == 'completed'
  end

end

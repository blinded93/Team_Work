class Assignment < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates_presence_of :title

  scope :completed, -> { where(status: 'completed') }
  scope :pending, -> { where(status: 'pending') }
  scope :past_due, -> { where(status: 'past_due') }


  def pending?
    status == 'pending'
  end

  def past_due?
    status == 'past_due'
  end

  def completed?
    status == 'completed'
  end 

end

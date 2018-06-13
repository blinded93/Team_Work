class Assignment < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates_presence_of :title

  scope :complete, -> { where(status: 'complete') }
  #scope :pending, -> { where(status: 'pending') }


  #def pending?
    #status == 'pending'
  #end

  #def completed?
  #  status == 'completed'
#  end

end

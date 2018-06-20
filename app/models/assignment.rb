class Assignment < ApplicationRecord

  enum status: { pending: 0, completed: 1 } do
    event :complete do
      transition :pending => :completed
    end
  end

  attr_accessor :state_event
  after_save :trigger_state, if: :state_event

  private

  def trigger_state
    send(state_event) if send(:"can_#{state_event}?")
  end


  belongs_to :user
  has_many :tasks

  validates_presence_of :title


  #def pending?
  #  status == '0'
#  end

#  def complete?
  #  status == '1'
#  end

end

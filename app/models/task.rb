class Task < ApplicationRecord
  belongs_to :assignment
  belongs_to :user 

  validates_presence_of :description

  def completed?
    !completed_at.blank?
  end

end#class

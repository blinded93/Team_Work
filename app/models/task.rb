class Task < ApplicationRecord
  belongs_to :assignment
  
  validates_presence_of :name


  def completed?
    !completed_at.blank?
  end

end#class

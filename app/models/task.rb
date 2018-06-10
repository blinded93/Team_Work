class Task < ApplicationRecord
  belongs_to :assignment

  def completed?
    !completed_at.blank?
  end

end#class 

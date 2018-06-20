class Task < ApplicationRecord
  belongs_to :assignment
  has_many :users, through: :assignments 
  validates_presence_of :description


  def completed?
    !completed_at.blank?
  end

end#class

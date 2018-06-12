class Task < ApplicationRecord
  belongs_to :assignment

  validates_presence_of :description

  #default_scope -> { order('created_at DESC') }
  #scope :completed, -> { where(completed: true) }
  #scope :incomplete, -> { where(completed: false) }

  def completed?
    !completed_at.blank?
  end

end#class

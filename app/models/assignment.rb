class Assignment < ApplicationRecord
  has_many :tasks

  validates_presence_of :title 
end

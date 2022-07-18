class Content < ApplicationRecord
  
  belongs_to :theme
  
  validates :meter, presence: true
  validates :repeat, presence: true
  validates :set, presence: true
  validates :second, presence: true
  validates :detail, presence: true
  
  def sum_seconds
    second * set * repeat
  end 
  
  def sum_meters
    meter * repeat * set
  end 
end

class Content < ApplicationRecord
  
  belongs_to :theme
  
  validates :meter, presence: true
  validates :repeat, presence: true
  validates :set, presence: true
  validates :second, presence: true
  validates :detail, presence: true
  #メニューのタイムの合計を出すメソッドを作成
  def sum_seconds
    second * set * repeat
  end 
  #メニューの距離の合計を出すメソッドを作成
  def sum_meters
    meter * repeat * set
  end 
end

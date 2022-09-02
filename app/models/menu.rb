class Menu < ApplicationRecord

  belongs_to :user
  has_many :themes, dependent: :destroy
  accepts_nested_attributes_for :themes, allow_destroy: true
#存在したらOk
  validates :title, presence: true
  validates :dating, presence: true


end

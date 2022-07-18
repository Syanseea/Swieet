class Theme < ApplicationRecord

belongs_to :menu
has_many :contents, dependent: :destroy
accepts_nested_attributes_for :contents, allow_destroy: true

validates :style, presence: true
end

class Theme < ApplicationRecord
  
belongs_to :menu
has_many :contents, dependent: :dest
end

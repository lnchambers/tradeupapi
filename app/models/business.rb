class Business < ApplicationRecord
  belongs_to :zip
  has_one :county, through: :zip
  validates_presence_of :name, :location
  enum category: ['Restaraunt', 'Construction', 'more stuff']
end

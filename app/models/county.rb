class County < ApplicationRecord
  has_many :zips
  has_many :businesses, through: :zips
  validates_presence_of :name
end

class Zip < ApplicationRecord
  has_many :businesses
  has_many :uas
  has_many :msas, through: :uas
  validates_presence_of :code
  validates_uniqueness_of :code
end

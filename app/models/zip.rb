class Zip < ApplicationRecord
  belongs_to :county
  has_many :businesses
  validates_presence_of :code
  validates_uniqueness_of :code
end

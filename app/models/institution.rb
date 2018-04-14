class Institution < ApplicationRecord
  validates_presence_of :name
  has_many :enrollments
  has_many :graduations
  has_many :catalogs
  has_many :programs, through: :catalogs
  enum type: ['Trade School', 'lolnuthing', 'College']
  enum tax_type: ['Profit', 'Not-For-Profit']
end

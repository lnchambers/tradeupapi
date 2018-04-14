class Institution < ApplicationRecord
  validates_presence_of :name
  has_many :enrollments
  has_many :graduations
  has_many :catalogs
  has_many :programs, through: :catalogs
  enum type_of_institution: ['trade_school', 'lolnuthing', 'college']
  enum tax_type: ['profit', 'not_for_profit']
end

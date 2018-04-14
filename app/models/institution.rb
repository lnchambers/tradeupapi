class Institution < ApplicationRecord
  validates_presence_of :name
  enum type: ['Trade School', 'lolnuthing', 'College']
  enum tax_type: ['Profit', 'Not-For-Profit']
end

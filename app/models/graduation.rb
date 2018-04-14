class Graduation < ApplicationRecord
  belongs_to :institution
  belongs_to :program
  enum residency: ['Stateless', 'In State', 'Out of State', 'Unclassified']

  def self.ordered_by_year
    order("year DESC")
  end
end

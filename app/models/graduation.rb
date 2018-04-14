class Graduation < ApplicationRecord
  belongs_to :institution
  belongs_to :program
  enum residency: ['in_state', 'out_of_state']

  def self.ordered_by_year
    order("year DESC")
  end
end

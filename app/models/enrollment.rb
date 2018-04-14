class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :program

  def self.ordered_by_year
    order("year DESC")
  end
end

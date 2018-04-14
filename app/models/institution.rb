class Institution < ApplicationRecord
  validates_presence_of :name
  has_many :enrollments
  has_many :graduations
  has_many :catalogs
  has_many :programs, through: :catalogs
  enum type_of_institution: ['Trade School', 'Technical School', 'College']
  enum tax_type: ['Profit', 'Not for Profit']

  def city
    address.split(",")[1].strip
  end

  def street_address
    address.split(",")[0].strip
  end

  def state
    address.split[-2].strip
  end

  def zip_code
    address.split[-1].strip
  end

  def graduation_rate
    (enrolled.count.to_f / graduated.count.to_f).round(2)
  end

  def enrolled
    enrolled ||= enrollments
  end

  def graduated
    graduated ||= graduations
  end

  def graduates_per_year(year)
    graduations.where(year: year).count
  end

  def enrollments_per_year(year)
    enrollments.where(year: year).count
  end

  def yearly_graduates_data
    graduations.ordered_by_year
  end

  def yearly_enrollments_data
    enrollments.ordered_by_year
  end

  def programs_to_json
    result = {}
    result[:programs] = {}
    programs.each do |p|
      binding.pry
      result[:programs].merge({ name: p.name })
    end
    result
  end
end

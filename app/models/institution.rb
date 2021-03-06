class Institution < ApplicationRecord
  validates_presence_of :name
  has_many :enrollments
  has_many :graduations
  has_many :catalogs
  has_many :programs, through: :catalogs
  enum type_of_institution: ['Trade School', 'Technical School', 'College']
  enum tax_type: ['For Profit', 'Not for Profit']

  def city
    a = address.split(",")[1]
    a.strip unless a.nil?
  end

  def street_address
    a = address.split(",")[0]
    a.strip unless a.nil?
  end

  def state
    a = address.split[-2]
    a.strip unless a.nil?
  end

  def zip_code
    a = address.split[-1]
    a.strip unless a.nil?
  end

  def graduation_rate(year = 2015)
    rate = (enrollments_per_year(year - 4) / graduates_per_year(year)).round(2)
    if rate > 1
      (rate - 1).round(2)
    else
      rate
    end
  end

  def enrolled
    enrolled ||= enrollments.count.to_f
  end

  def graduated
    graduated ||= graduations.count.to_f
  end

  def graduates_per_year(year)
    graduations.where(year: year).count.to_f
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
end

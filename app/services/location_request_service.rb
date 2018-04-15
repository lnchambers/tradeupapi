class LocationRequestService

  def initialize(i)
    @institutions = i
  end

  def index
    binding.pry
    refine_institutions
  end

  private

  attr_reader :institutions

  def refine_institutions
    n = 0
    institutions.map do |i|
      n += 1
      {"address #{n}" => i.city}
    end
  end

end

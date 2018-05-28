class LocationRequestService

  def initialize(i)
    @institutions = i
  end

  def index
    refine_institutions
  end

  private

  attr_reader :institutions

  def refine_institutions
    institutions.map do |i|
      {"address" => i.city}
    end.uniq
  end

end

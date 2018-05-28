class InstitutionRequestService

  def initialize(params, institutions = nil)
    @params = params
    @institutions = institutions
  end

  def index
    institutions_scope.map do |i|
      {
        :name => i.name,
        :type_of_institution => i.name,
        :school_type => i.tax_type,
        :address => i.address,
        :contact_person => i.contact_person,
        :contact_email => i.contact_email,
        :street_address => i.street_address,
        :state => i.state,
        :city => i.city,
        :zip_code => i.zip_code,
        :graduation_rate => i.graduation_rate
      }
    end
  end

  def show(i)
    {
      :name => i.name,
      :type_of_institution => i.name,
      :school_type => i.tax_type,
      :address => i.address,
      :contact_person => i.contact_person,
      :contact_email => i.contact_email,
      :street_address => i.street_address,
      :state => i.state,
      :city => i.city,
      :zip_code => i.zip_code,
      :graduation_rate => i.graduation_rate
    }
  end

  private

    attr_reader :params, :institutions

    def institutions_scope
      if params[:location]
        institutions_by_location
      else
        institutions
      end
    end

    def institutions_by_location
      institutions.map do |i|
        i if i.city.downcase == params[:location].downcase
      end.compact
    end

end

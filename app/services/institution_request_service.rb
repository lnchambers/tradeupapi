class InstitutionRequestService

  def initialize(params)
    @params = params
  end

  def index(institutions)
    institutions.map do |i|
      {
        name: i.name,
        type_of_institution: i.name,
        school_type: i.tax_type,
        address: i.address,
        contact_person: i.contact_person,
        contact_email: i.contact_email
        street_address: i.street_address
        state: i.state
        zip_code: i.zip_code
        graduation_rate: i.graduation_rate
      }
  end

  def show(id)
    i = Institution.find(id)
    {
      name: i.name,
      type_of_institution: i.name,
      school_type: i.tax_type,
      address: i.address,
      contact_person: i.contact_person,
      contact_email: i.contact_email
      street_address: i.street_address
      state: i.state
      zip_code: i.zip_code
      graduation_rate: i.graduation_rate
    }
  end

  private

    attr_reader :params

end

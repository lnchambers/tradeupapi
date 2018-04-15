require 'rails_helper'

describe "Schools API" do
  before :each do
    i_1 = create(:institution)
    i_2 = create(:institution, name: "Opakawagalaga Eupanifahorious")
    prog = create(:program)
    prog_2 = create(:program, name: "Bennificatris")
    Catalog.create!(institution: i_1, program: prog)
    Catalog.create!(institution: i_2, program: prog)
    Catalog.create!(institution: i_2, program: prog_2)
  end
  it "can respond to index requests" do
    get "/api/v1/schools"

    expect(response).to be_success
  end

  it "can respond to show requests" do
    get "/api/v1/schools/3"

    expect(response).to be_success
  end
end

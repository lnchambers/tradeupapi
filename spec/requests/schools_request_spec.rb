require 'rails_helper'

describe "Schools API" do
  before :each do
    i_1 = create(:institution)
    i_2 = create(:institution, name: "Opakawagalaga Eupanifahorious")
    i_3 = create(:institution, name: "Benedictus Cumberbund", address: "5401 20th St, Fort Collins, CO 80634")
    prog = create(:program)
    prog_2 = create(:program, name: "Bennificatris")
    Catalog.create!(institution: i_1, program: prog)
    Catalog.create!(institution: i_2, program: prog)
    Catalog.create!(institution: i_2, program: prog_2)
    Catalog.create!(institution: i_3, program: prog_2)
  end
  it "can respond to index requests" do
    get "/api/v1/schools"

    expect(response).to be_success
  end

  it "can respond to show requests by id" do
    get "/api/v1/schools/5"

    expect(response).to be_success
  end

  it "can respond to show requests by location" do
    get "/api/v1/schools?location=Greeley"

    expect(response).to be_success
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed.count).to eq(2)
    expect(parsed[1][:name]).to eq("Opakawagalaga Eupanifahorious")
    expect(parsed[1][:type_of_institution]).to eq("Opakawagalaga Eupanifahorious")
    expect(parsed[1][:school_type]).to eq("Not for Profit")
    expect(parsed[1][:address]).to eq("5401 20th St, Greeley, CO 80634")
    expect(parsed[1][:street_address]).to eq("5401 20th St")
    expect(parsed[1][:state]).to eq("CO")
    expect(parsed[1][:city]).to eq("Greeley")
    expect(parsed[1][:zip_code]).to eq("80634")
  end
end

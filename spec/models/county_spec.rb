require 'rails_helper'

RSpec.describe County, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:zips) }
  it { should have_many(:businesses).through(:zips) }
end

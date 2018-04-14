require 'rails_helper'

RSpec.describe Program, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:enrollments) }
  it { should have_many(:graduations) }
  it { should have_many(:catalogs) }
  it { should have_many(:institutions).through(:catalogs) }
end

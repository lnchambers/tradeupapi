require 'rails_helper'

RSpec.describe Institution, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:enrollments) }
  it { should have_many(:graduations) }
  it { should have_many(:catalogs) }
  it { should have_many(:programs).through(:catalogs) }
end

require 'rails_helper'

RSpec.describe Msa, type: :model do
  it { should have_many(:uas) }
  it { should have_many(:zips).through(:uas) }
end

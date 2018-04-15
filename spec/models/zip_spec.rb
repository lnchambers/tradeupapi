require 'rails_helper'

RSpec.describe Zip, type: :model do
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
  it { should belong_to(:county) }
  it { should have_many(:businesses)}
end

require 'rails_helper'

RSpec.describe Business, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should belong_to(:zip) }
end

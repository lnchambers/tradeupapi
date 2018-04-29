require 'rails_helper'

RSpec.describe Ua, type: :model do
  it { should belong_to(:zip) }
  it { should belong_to(:msa) }
end

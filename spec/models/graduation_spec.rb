require 'rails_helper'

RSpec.describe Graduation, type: :model do
  it { should belong_to(:institution) }
  it { should belong_to(:program) }
end

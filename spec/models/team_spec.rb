require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:users).through(:participants) }
  it { should have_many(:participants) }
  it { should have_and_belong_to_many(:matches) }
end

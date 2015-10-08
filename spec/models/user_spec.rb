require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:teams).through(:participants) }
  it { should have_many(:participants) }
end

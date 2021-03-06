require 'rails_helper'

RSpec.describe Participant, type: :model do
  it { should belong_to(:team) }
  it { should belong_to(:user) }
end

require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:record) { create(:record) }

  it { expect(record).to be_valid }

  it { should validate_presence_of(:cost) }
  it { should validate_presence_of(:date) }
end

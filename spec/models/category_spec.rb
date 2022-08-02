require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  it { expect(category).to be_valid }

  it { should validate_presence_of(:name) }
end

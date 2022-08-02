require 'rails_helper'

RSpec.describe User, type: :model do
  context 'valid' do
    let(:user) { create(:user) }
    it { expect(user).to be_valid }
  end

  context 'invalid phone number' do
    let(:user) { build :user, :with_invalid_email }
    it { expect(user).to_not be_valid }
  end

  context 'invalid password' do
    let(:user) { build :user, :with_invalid_password }
    it { expect(user).to_not be_valid }
  end
end

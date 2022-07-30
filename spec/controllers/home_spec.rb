require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'when user not logged' do
    it {
      get :index
      is_expected.to redirect_to('/users/sign_in')
    }
  end

  describe 'when user logged' do
    before do
      sign_in create(:user)
    end
    it { get :index }
  end
end

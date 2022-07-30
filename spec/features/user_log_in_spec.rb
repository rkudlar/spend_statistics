require 'rails_helper'

RSpec.feature 'User log in', type: :feature do
  let(:user) { create(:user) }

  scenario 'log in as a user' do
    visit new_user_session_path
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button('Log in')
    # TODO
  end
end

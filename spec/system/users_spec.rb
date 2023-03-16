require 'rails_helper'

RSpec.describe "Users", type: :system do

  before do
    @user = FactoryBot.create(:user)
  end

  context "一般ユーザの場合" do
    it "ログインできる" do
      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_on "Log in"
      expect(page).to have_content @user.name
    end

  end
end

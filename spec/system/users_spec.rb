require 'rails_helper'

RSpec.describe "Users", type: :system do

  before do
    @user1 = FactoryBot.create(:user1)
  end

  context "一般ユーザの場合" do
    it "ログインできる" do
      visit new_user_session_path
      fill_in "user[email]", with: @user1.email
      fill_in "user[password]", with: @user1.password
      click_on "Log in"
      expect(page).to have_content @user1.name
    end

  end
end

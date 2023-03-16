require 'rails_helper'

RSpec.describe "Follows", type: :system do

  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:other_user)
    sign_in @user
  end

  context "一般ユーザの場合" do
    it "フォローできる" do
      pending "follow押した後のunfollowがとれないので一旦pending"
      visit users_path
      el_user_id = "#user_#{@other_user.id}"
      within el_user_id do
        # click_on 'Follow'
        find(".button_to").click
      end

      visit users_path
      within el_user_id do
        expect(find(".button_to")).to have_text "UnFollow"
      end
    end

    it "アンフォローできる" do
      visit users_path
      pending 
      visit users_path
      el_user_id = "#user_#{@other_user.id}"
      within el_user_id do
        find(".button_to").click
        expect(follow).to have_content "Follow"
      end
    end
  end
  
end

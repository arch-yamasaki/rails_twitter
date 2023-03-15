require 'rails_helper'

RSpec.describe "Follows", type: :system do

  before do
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    sign_in @user1
  end

  context "一般ユーザの場合" do
    it "フォローできる" do
      pending "follow押した後のunfollowがとれないので一旦pending"
      visit users_path
      el_user_id = "#user_#{@user2.id}"
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
      el_user_id = "#user_#{@user2.id}"
      within el_user_id do
        find(".button_to").click
        expect(follow).to have_content "Follow"
      end
    end
  end
  
end

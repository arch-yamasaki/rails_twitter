require "rails_helper"

RSpec.describe Tweet, type: :system do
  describe "Tweetモデル" do
    context "一般ユーザの場合" do
      before do
        @user = User.create!(
          name: "sample_name",
          birthday: Date.new(1980, 1, 1),
        )
      end
      it "" do
        visit new_user_tweet_path(@user.id)
        fill_in 'Text', with: 'こんにちは'
        click_button 'Create Tweet'
        expect(Tweet.find_by(user_id: @user.id).text).to eq 'こんにちは'
      end
    end
  end
end

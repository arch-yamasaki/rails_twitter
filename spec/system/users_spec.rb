require 'rails_helper'

RSpec.describe "Users", type: :system do
  
  # 変数を定義
  let!(:user) { FactoryBot.create(:user)}
  let!(:other_user) { FactoryBot.create(:other_user)}

  context "一般ユーザの場合" do
    it "ログインできる" do
      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_on "Log in"
      expect(page).to have_content user.name
    end
  end

  context "ログインできるユーザの場合" do
    before do
      sign_in user
    end
    
    it 'プロフィールページから編集ページに正しく飛べる' do
      # 編集画面へのリンクをクリック
      visit user_path(user)
      find('.btn').click
      # 編集画面に正しく遷移したことを確認
      expect(page).to have_current_path(edit_user_path(user))
    end

    it 'ユーザが情報の編集ができる' do
      visit edit_user_path(user)
      update_name = 'Jane Doe'
      update_birthday_str = '1999-12-31'
      
      # 新しいユーザー情報を入力
      find('#user_name').set(update_name)
      find('#user_birthday').set(update_birthday_str)
  
      # 更新ボタンをクリック
      # binding.pry
      find(".btn.btn-primary").click
  
      # 更新が成功したことを確認
      expect(page).to have_content('User was successfully updated.')
  
      # データベースの値が正しく更新されたことを確認
      user.reload
      expect(user.name).to eq update_name
      expect(user.birthday).to eq Date.parse(update_birthday_str)
    end
  
    it 'shows an error when user information is invalid' do
      pending "後で直す"
      # 無効なユーザー情報を入力
      fill_in 'Name', with: ''
      fill_in 'Birthday', with: ''
  
      # 更新ボタンをクリック
      click_on 'Update User'
  
      # エラーメッセージが表示されることを確認
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Birthday can't be blank")
    end
  end

  context "他のユーザの場合" do
    before do
      sign_in user
    end
    
    it '編集ページが存在しない' do
      visit edit_user_path(other_user)
      expect(page).not_to have_content('edit')
    end

  end


end

require 'rails_helper'

RSpec.describe 'Profile Image management', type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }

  before do
    sign_in user
  end

  describe 'uploading a profile image' do
    before do
      visit edit_user_path(user)
    end

    it 'allows the user to upload a profile image' do
      attach_file "user_profile_image", Rails.root.join('spec', 'fixtures', 'test_image.png')
      click_on 'Update User'
      expect(page).to have_content('User was successfully updated')
      user.reload
      expect(user.profile_image).to be_attached
    end
  end

  describe 'displaying a profile image' do
    context 'when the user has a profile image' do
      before do
        user.profile_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.png')), filename: 'test_image.png', content_type: 'image/jpeg')
      end

      it 'displays the uploaded profile image' do
        visit user_path(user)
        expect(page).to have_css("img[src*='#{user.display_profile_image.filename}']")
      end
    end

    context 'when the user does not have a profile image' do
      it 'displays the default profile image' do
        visit user_path(other_user)
        # src 属性の値が /assets/default_user で始まり、.png で終わる img タグを検索する。
        expect(page).to have_css("img[src^='/assets/default_user'][src$='.png']")
      end
    end
  end
end

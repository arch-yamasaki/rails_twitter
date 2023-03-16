require 'rails_helper'

RSpec.describe User do
  describe 'userモデルに関するテスト' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '簡単なテスト' do
      expect(@user).to be_valid
    end
  end  
end


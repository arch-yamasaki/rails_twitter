require 'rails_helper'

RSpec.describe User do
  describe 'userモデルに関するテスト' do
    before do
      @user1 = FactoryBot.build(:user1)
    end
    it '簡単なテスト' do
      expect(@user1).to be_valid
    end
  end  
end


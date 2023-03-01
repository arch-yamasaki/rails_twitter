require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'userモデルに関するテスト' do
    before do
      @user1 = User.new({ name: 'user1', birthday: Date.new(1980, 1, 1)})
      @user2 = User.new({ name: 'user2', birthday: Date.new(1990, 1, 1)})
    end
    it '簡単なテスト' do
      expect(@user1).to be_valid
    end
  end  
end

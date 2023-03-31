require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user)}
  let(:other_user) { FactoryBot.create(:other_user)}
  subject { described_class}

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
  
  permissions :update? do
    it "grants access if user is current_user" do
      expect(subject).to permit(user, user)
    end
  
    it "denies access if user is not current_user" do
      expect(subject).not_to permit(user, other_user)
    end
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end

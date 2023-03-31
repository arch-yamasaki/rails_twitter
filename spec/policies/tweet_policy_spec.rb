require 'rails_helper'

RSpec.describe TweetPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user)}
  let(:other_user) { FactoryBot.create(:other_user)}
  let(:tweet) {user.tweets.create(text: "user1 tweet")}
  let(:other_tweet) {other_user.tweets.create(text: "user1 tweet")}

  subject { described_class }

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
    # it "grants create if user is present" do
    #   expect(subject).to permit(user)
    # end
  end

  permissions :delete? do
    it "not grants delete except admin user" do
      expect(subject).not_to permit(user, tweet)
    end
  end

  end

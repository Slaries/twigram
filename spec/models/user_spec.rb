require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(email: 'user1@user.com', name: 'user1') }
  before{user.save}

  context 'validation test' do
    it 'ensure user preference' do
      user = User.new(name: 'user', email: 'user@user.com')
      expect(user).to_not be_valid
    end

    it 'must have not more 40 chars in name' do
      user.name = 'a' * 42
      expect(user).not_to be_valid
    end

    it 'should save success' do
      user = User.new(name: 'User', email: 'user1@user.com', password: 'password')
      expect(user).to be_valid
    end
  end

  context 'cannot use the same email in different accounts' do
    let(:user1) { User.new(email: 'user@user.com', name: 'user1') }

    it {expect(user1).to_not be_valid}
  end

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive}

  it { is_expected.to have_many(:follower_follows).with_foreign_key(:following_id).class_name('Follow') }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }

  it { is_expected.to have_many(:following_follows).with_foreign_key(:follower_id).class_name('Follow') }
  it { is_expected.to have_many(:followings).through(:following_follows).source(:following) }
end

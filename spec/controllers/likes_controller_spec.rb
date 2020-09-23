require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let!(:post) { create :post}
  let(:user) { create :user }
  before {sign_in user}

  describe '#create' do
    let!(:post) { create :post}
    let(:params) { { post_id: post.id, user_id: user.id } }

    subject { get :create, method: :post, params: params }

    it 'create like' do
      expect { subject }.to change { Like.count }.by(1)
    end
  end
end
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post) { create :post}
  let(:user) { create :user }
  before {sign_in user}

  describe '#create' do
    let!(:post) { create :post}
    let(:params) do
      { comment:
            { context: 'Comments', post_id: post.id, user_id: user.id } }
    end
    subject { get :create, method: :post, params: params }

    it 'create new comment' do
      expect { subject }.to change { Comment.count }.by(1)
    end
  end
end
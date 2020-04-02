require 'rails_helper'

describe FollowingsController, type: :controller do
  before do
    login_user
  end

  describe 'POST create' do
    it 'has to create a new Follow' do
      request.env['HTTP_REFERER'] = 'http://example.com'
      user = User.find(2)
      expect do
        post :create, params: { id: user.id }
      end.to change(Following, :count).by(1)
    end
  end
end

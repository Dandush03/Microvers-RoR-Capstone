require 'rails_helper'

describe CulturesController, type: :controller do
  before do
    login_user
  end

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      response.code.should eq('200')
    end
  end

  describe 'GET show' do
    it 'has a 200 status code' do
      get :show, params: { id: 1 }
      response.code.should eq('200')
    end
  end

  describe 'POST create' do
    it 'has a 200 status code' do
      request.env['HTTP_REFERER'] = 'http://example.com'
      post :create, params: { culture: { text: 'test' } }
      get :index
      response.code.should eq('200')
    end
  end
end

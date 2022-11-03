require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) { FactoryBot.create(:user) }

  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it 'returns http success' do
      get edit_user_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it 'returns http success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

  end

end

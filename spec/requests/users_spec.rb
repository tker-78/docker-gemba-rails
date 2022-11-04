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
  
  describe 'POST /create' do


    it 'ユーザーを作成できる' do
      user_params = FactoryBot.attributes_for(:user)
      post users_path, params: { user: user_params }
      expect(response).to have_http_status(:redirect)
      expect(flash[:notice]).to include("ユーザーを作成しました")
    end
  end

  describe 'PUT /update' do
    context '属性が誤った形式の場合' do
      it 'ユーザーの編集が失敗すること' do
        user_params = {user: FactoryBot.attributes_for(:user) }
        user_params[:user][:email] = nil
        put user_path(user), params: user_params
        expect(flash.notice).to include('アップデートに失敗しました') 
      end
    end

    context '属性値が正しい場合' do
      it 'ユーザーの編集が成功すること' do
        user_params = {user: FactoryBot.attributes_for(:user) }
        user_params[:user][:email] = "bbb@gmail.com"
        put user_path(user.id), params: user_params
        expect(flash.notice).to include('ユーザー情報をアップデートしました')
      end
    end
  end
  
end

require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end

    it 'emailの入力欄が表示されていること' do
      get login_path
      expect(response.body).to include('session_email')
    end

    it 'passwordの入力欄が表示されていること' do
      get login_path
      expect(response.body).to include('session_password')
    end
  end

  describe "POST /create" do


    context '正しいパラメータを渡した場合' do
      it 'ログインできること' do
        session_params = { session: {email: user.email, password: user.password }}
        post login_path, params: session_params
        expect(flash.notice).to include('ログインしました')
      end
    end
  end

  describe 'DELETE /destroy' do

    context 'ログインしている場合' do
      before do
        login(user)
      end

      it 'ログアウトできること' do
        delete logout_path
        expect(response).to have_http_status(:redirect)
        expect(flash.notice).to include('ログアウトしました')
      end
    end

    context 'ログインしていない場合' do
      it 'rootページにリダイレクトされること' do
        delete logout_path
        expect(response).to redirect_to(root_path)
      end
    end
  end

  private
  def login(user)
    session_params = { session: { email: user.email, password: user.password }}
    post login_path, params: session_params
  end
end

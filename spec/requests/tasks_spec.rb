require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }

  context 'ログインしていないとき' do
    describe 'GET /index' do
      it 'rootページにリダイレクトされること' do
        get tasks_path
        expect(response).to redirect_to(root_path)
      end
    end

  end

  context 'ログインしているとき' do
    before do
      login(user)
    end

    describe 'GET /index' do
      it 'タスク情報が表示されていること' do
        task
        get tasks_path
        expect(response.body).to include(task.name)
      end
    end
  end



  private
  def login(user)
    session_params = { session: { email: user.email, password: user.password }}
    post login_path, params: session_params
  end


end

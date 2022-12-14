require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }

  context 'ログインしていないとき' do
    describe 'GET /index' do
      it 'loginページにリダイレクトされること' do
        get tasks_path
        expect(response).to redirect_to(login_path)
      end
    end

  end

  context 'ログインしているとき' do
    before do
      login(user)
      task
    end

    describe 'GET /index' do
      it 'タスク情報が表示されていること' do
        get tasks_path
        expect(response.body).to include(task.name)
      end


      it '詳細ボタンが表示されていること' do
        get tasks_path
        expect(response.body).to include('詳細')
      end

      it '削除ボタンが表示されていること' do
        get tasks_path
        expect(response.body).to include('削除')
      end
    end

    describe 'GET /show' do
      it 'タスク情報が表示されていること' do
        get task_path(task)
        expect(response.body).to include(task.name)
        expect(response.body).to include(task.description)
      end
    end
  end



  private
  def login(user)
    session_params = { session: { email: user.email, password: user.password }}
    post login_path, params: session_params
  end


end

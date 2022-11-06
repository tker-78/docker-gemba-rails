require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }
  context '正しい属性値のとき' do
    it '新規タスクが有効であること' do
      expect(task).to be_valid
    end
  end

  context '間違った属性値の場合' do
    context '名前がない場合' do
      it '新規タスクが無効であること' do
        task.name = nil
        expect(task).to_not be_valid
      end
    end


  end
end

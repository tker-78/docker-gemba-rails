require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user)}
  context '無効な属性の場合' do
    it 'ユーザー名がブランクの場合' do
      user.name = ''
      user.save
      expect(user.errors.full_messages).to include("名前を入力してください")
    end
  end
end

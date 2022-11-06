require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user)}
  context '無効な属性の場合' do
    it 'ユーザー名がブランクの場合エラーメッセージを出力すること' do
      user.name = ''
      user.save
      expect(user.errors.full_messages).to include("名前を入力してください")
    end

    it 'メールアドレスがブランクの場合エラーメッセージを出力すること' do
      user.email = ''
      user.save
      expect(user.errors.full_messages).to include("メールアドレスを入力してください")
    end

    it 'メールアドレスが@を含まない場合エラーメッセージを出力すること' do
      user.email = 'aaagmail.com'
      user.save
      expect(user.errors.full_messages).to include("メールアドレスが不正な値です")
    end

    it 'メールアドレスが.を含まない場合エラーメッセージを出力すること' do
      user.email = 'aaa@gmailcom'
      user.save
      expect(user.errors.full_messages).to include("メールアドレスが不正な値です")
    end

    it 'メールアドレスに重複がある場合ユーザーは無効であること' do
      user
      user2 = FactoryBot.build(:user)
      user2.save
      expect(user2.errors.full_messages).to include("メールアドレスはすでに存在します")
    end

    it 'パスワードがブランクの場合ユーザーは無効であること' do
      user.password = nil 
      user.password_confirmation = nil
      user.valid?
      expect(user).to_not be_valid
    end

    it 'パスワードに記号を含む場合ユーザーは無効であること' do
      user.password = '@@@@@@'
      user.password_confirmation = '@@@@@@'
      user.valid?
      expect(user).to_not be_valid
    end

    it 'パスワードが５文字以下の場合、ユーザーは無効であること' do
      user.password = '12345'
      user.password_confirmation = '12345'
      user.valid?
      expect(user).to_not be_valid
    end
  end


  context '有効な属性の場合' do
    it 'ユーザーのが有効であること' do
      user.name = 'takuya kinosita'
      user.email = 'aaa@gmail.com'
      expect(user).to be_valid
    end
  end
end

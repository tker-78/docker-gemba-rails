require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "ユーザーは新しいタスクを作成できる" do
    user = FactoryBot.create(:user) 
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログイン'
    expect(page).to have_content('ログインしました')
    expect(page).to have_content('ユーザー情報')
    expect(page).to have_content(user.email)

  end
end

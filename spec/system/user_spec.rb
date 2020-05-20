require 'rails_helper'

describe 'ログイン/新規登録', type: :system do

  describe 'ログインする' do
    before do
      create(:user, name: 'ユーザーA', email: 'a@example.com', password: 'password')
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'a@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    it 'ログイン後、記事一覧へ遷移する' do
      expect(page).to have_content '記事一覧'
    end
  end

  describe '新規登録する' do
    before do
      visit new_user_registration_path
      fill_in 'ユーザー名', with: "むらかみ"
      fill_in 'メールアドレス', with: "murakami@example.com"
      fill_in 'パスワード(6文字以上)', with: "password"
      fill_in '確認用パスワード', with: "password"
      click_button "新規登録"
    end

    it '登録後、記事一覧へ遷移する' do
      expect(page).to have_content '記事一覧'
    end
  end
end

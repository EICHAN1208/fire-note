require 'rails_helper'

describe '記事投稿機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:article, title: '最初の記事', user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end

      it 'ユーザーAが作成した記事が表示される' do
        expect(page).to have_content '最初の記事'
      end
    end
  end
end

require 'rails_helper'

describe '記事管理機能', type: :system do
  let(:user_a) {create(:user, name: 'ユーザーA', email: 'a@example.com')}
  let(:user_b) {create(:user, name: 'ユーザーB', email: 'b@example.com')}
  let!(:article_a) {create(:article, title: '最初の記事', user: user_a)}

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
  end

  shared_examples_for 'ユーザーAが作成した記事が表示される' do
    it {expect(page).to have_content '最初の記事'}
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) {user_a}

      it_behaves_like 'ユーザーAが作成した記事が表示される'
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) {user_b}

      it 'ユーザーAが作成した記事が表示される' do
        expect(page).to have_content '最初の記事'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) {user_a}

      before do
        visit article_path(article_a)
      end

      it_behaves_like 'ユーザーAが作成した記事が表示される'
    end
  end
end

#== Schema Information

#Table name: articles

# t.text "title"
# t.string "kind"
# t.text "summary"
# t.text "content"
# t.text "good_point"
# t.text "problem"
# t.text "challenge"
# t.integer "user_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#valid?' do
    let(:article) { build(:article, title: title, kind: kind, summary: summary, content: content) }
    let(:title) { 'タイトル' }
    let(:kind) { 'その他' }
    let(:summary) { '概要' }
    let(:content) { '活動内容' }
    subject { article.valid? }

    context 'title' do
      context '空の場合' do
        let(:title) { nil }
        it { is_expected.to be_falsey }
      end

      context '48文字以上の場合' do
        let(:title) { 'ああああああああああああああああああああああああああああああああああああああああああああああああああ' }
        it { is_expected.to be_falsey }
      end

      context '正しく入力されている場合' do
        let(:title) { '木造2階建て炎上火災' }
        it { is_expected.to be_truthy }
      end
    end

    context 'kind' do
      context '空の場合' do
        let(:kind) { nil }
        it { is_expected.to be_falsey }
      end

      context '正しく入力されている場合' do
        let(:kind) { 'その他' }
        it { is_expected.to be_truthy }
      end
    end

    context 'summary' do
      context '空の場合' do
        let(:summary) { nil }
        it { is_expected.to be_falsey }
      end

      context '正しく入力されている場合' do
        let(:summary) { 'CPA事案に伴う、救急隊と消防隊のPA連携' }
        it { is_expected.to be_truthy }
      end
    end

    context 'content' do
      context '空の場合' do
        let(:content) { nil }
        it { is_expected.to be_falsey }
      end

      context '正しく入力されている場合' do
        let(:content) { '救急隊と消防隊合同で傷病者の救命処置を実施した後、消防隊1名救急車に同乗のもと救命センターへ搬送した。' }
        it { is_expected.to be_truthy }
      end
    end

  end
end

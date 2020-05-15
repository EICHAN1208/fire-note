FactoryBot.define do
  factory :article do
    title {'テストを書く'}
    kind {'その他'}
    summary {'概要がはいります'}
    content {'活動内容がはいります'}
    good_point {'良かったことがはいります'}
    problem {'問題点がはいります'}
    challenge {'次に挑戦することがはいります'}
    user
  end
end

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  image_data :text(65535)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  it "タイトル、名前、本文、ユーザーidがある場合、有効である" do
    article = build(:article)
    expect(article).to be_valid
  end

  it "名前がない場合、無効である" do
    article = build(:article, name: nil)
    article.valid?
    expect(article.errors[:name]).to include("を入力してください")
  end

  it "名前が11文字以上の場合、無効である" do
    article = build(:article, name: "a" * 11)
    article.valid?
    expect(article.errors[:name]).to include("は10文字以内で入力してください")
  end

  it "タイトルがない場合、無効である" do
    article = build(:article, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("を入力してください")
  end

  it "タイトルが31文字以上の場合、無効である" do
    article = build(:article, title: "a" * 31)
    article.valid?
    expect(article.errors[:title]).to include("は30文字以内で入力してください")
  end

  it "本文がない場合、無効である" do
    article = build(:article, body: nil)
    article.valid?
    expect(article.errors[:body]).to include("を入力してください")
  end

  it "本文が1001文字以上の場合、無効である" do
    article = build(:article, body: "a" * 1001)
    article.valid?
    expect(article.errors[:body]).to include("は1000文字以内で入力してください")
  end
end

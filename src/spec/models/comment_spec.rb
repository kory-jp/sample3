# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "名前、コメントがある場合、有効である" do
    comment = build(:comment)
    expect(comment).to be_valid
  end

  it "名前がない場合、無効である" do
    comment = build(:comment, name: nil)
    comment.valid?
    expect(comment.errors[:name]).to include("を入力してください")
  end

  it "名前が11文字以上の場合、無効である" do
    comment = build(:comment, name: "a" * 11)
    comment.valid?
    expect(comment.errors[:name]).to include("は10文字以内で入力してください")
  end

  it "コメントがない場合、無効である" do
    comment = build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("を入力してください")
  end

  it "コメントが1001文字以上の場合、無効である" do
    comment = build(:comment, comment: "a" * 1001)
    comment.valid?
    expect(comment.errors[:comment]).to include("は1000文字以内で入力してください")
  end

end

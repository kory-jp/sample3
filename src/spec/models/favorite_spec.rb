# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_article_id              (article_id)
#  index_favorites_on_user_id                 (user_id)
#  index_favorites_on_user_id_and_article_id  (user_id,article_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'お気に入り機能' do
    context '正常系' do
      it 'article_id,user_idがある場合、有効である' do
        favorite = build(:favorite)
        expect(favorite).to be_valid
      end
    end

    context '異常系' do
      it 'article_idがない場合,無効である' do
        favorite = build(:favorite, article: nil)
        favorite.valid?
        expect(favorite.errors[:article]).to include("を入力してください")
      end

      it 'user_idがない場合,無効である' do
        favorite = build(:favorite, user: nil)
        favorite.valid?
        expect(favorite.errors[:user]).to include("を入力してください")
      end
    end
  end
end

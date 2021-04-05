# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :integer
#  following_id :integer
#
require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relationship) {FactoryBot.create(:relationship)}

  describe 'フォロー機能' do
    context '正常系' do
      it 'フォローユーザー、フォロワーがいる場合、有効である' do
        expect(relationship).to be_valid
      end
    end

    context '異常系' do
      it 'following_idがない場合、無効である' do
        relationship.following = nil
        relationship.valid?
        expect(relationship.errors[:following]).to include("を入力してください")
      end

      it 'follower_idがない場合、無効である' do
        relationship.follower = nil
        relationship.valid?
        expect(relationship.errors[:follower]).to include("を入力してください")
      end
    end

    # context "一意性の検証" do
    #   before do
    #     @relation = FactoryBot.create(:relationship)
    #     @user1 = FactoryBot.build(:relationship)
    #   end

    #   it "following_idとfollower_idの組み合わせが一意でなければ保存できない" do
    #     relation2 = FactoryBot.build(:relationship, following: @relation.following, follower: @relation.follower)
    #     relation2.valid?
    #     expect(relation2.errors[:following]).to include("はすでに存在します")
    #   end
    # end
  end
end

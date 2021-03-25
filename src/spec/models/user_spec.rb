# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  image_data      :text(65535)
#  introduction    :text(65535)
#  mail            :string(255)      not null
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_mail  (mail) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前、メールアドレス、パスワードがある場合は、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end


  it "名前がない場合は、無効である" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end


  it "メールアドレスがない場合は、無効である" do
    user = FactoryBot.build(:user, mail: nil)
    user.valid?
    expect(user.errors[:mail]).to include("を入力してください")
  end

  it "重複したメールアドレスの場合は、無効である" do
    user1 = FactoryBot.create(:user, mail: "sample@example.com")
    user2 = FactoryBot.build(:user, mail:  "sample@example.com")
    user2.valid?
    expect(user2.errors[:mail]).to include("はすでに存在します")
  end

  it "パスワードがない場合は、無効である" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "パスワードが8文字以下の場合、無効である" do
    user = FactoryBot.build(:user, password: "1234567")
    user.valid?
    expect(user.errors[:password]).to include("は8文字以上で入力してください")
  end
end

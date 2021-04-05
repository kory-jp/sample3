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
FactoryBot.define do
  factory :relationship do
    # following { FactoryBot.create(:user, id:101 ) }
    # follower { FactoryBot.create(:user, id:102) }

    sequence(:following) {|n| FactoryBot.create(:user, id:"10#{n}")}
    sequence(:follower) {|n| FactoryBot.create(:user, id:"20#{n}")}
  end
end

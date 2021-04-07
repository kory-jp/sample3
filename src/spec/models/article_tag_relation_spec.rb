# == Schema Information
#
# Table name: article_tag_relations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_article_tag_relations_on_article_id  (article_id)
#  index_article_tag_relations_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (tag_id => tags.id)
#
require 'rails_helper'

RSpec.describe ArticleTagRelation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

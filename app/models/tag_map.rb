class TagMap < ApplicationRecord
  belongs_to :micropost
  belongs_to :tag
  # マイクロポストとタグの関連付け
  
  validates :micropost_id, presence: true
  validates :tag_id, presence: true
  
end

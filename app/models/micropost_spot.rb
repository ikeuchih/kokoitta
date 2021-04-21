class MicropostSpot < ApplicationRecord
  belongs_to :micropost
  belongs_to :spottag
end

# マイクロポストとスポットタグの関連付け
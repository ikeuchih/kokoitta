class Spottag < ApplicationRecord
    
    has_many :micropost_spots, dependent: :destroy
    has_many :microposts, through: :micropost_spots
    
    # 中間テーブル経由してマイクロポストと関連付け
    # 削除されたら削除されるように紐づけ
end

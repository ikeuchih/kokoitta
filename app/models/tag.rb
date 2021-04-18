class Tag < ApplicationRecord
    has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
    has_many :microposts, through: :tag_maps
    
    # tag_mapsテーブルとの関連付けを行ってから、
    # tag_mapsを通してmicropostsテーブルと関連づけています
end

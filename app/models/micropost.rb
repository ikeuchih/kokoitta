class Micropost < ApplicationRecord
  belongs_to :user
 # マイクロポストは1人のユーザーと紐づく
 
  has_many :tag_maps, dependent: :destroy
  # throughオプションを使う場合、
  # 先にその中間テーブルとの関連付けを行う必要がある
  # dependent: :destroyオプションを付けることで、
  # Postが削除されると同時にPostとTagの関係が削除
  
  
  has_many :tags, through: :tag_maps
  # throughオプションによって、
  # tag_mapsテーブルを通してtagsテーブルとの関連付けを行う
  # 一つのタグしかつけれないのでhas_one
  
  has_many :micropost_spots, dependent: :destroy
  has_many :spottags, through: :micropost_spots
  
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validates :picture, presence: true
  validate  :picture_size
 # ユーザーID・コンテンツが空白の場合はマイクロポストできないように
 
 
    def save_tag(tag_ids, spottag_ids)
      tag_id_list = Array(tag_ids)
      spottag_id_list = Array(spottag_ids)
      
        tag_id_list.zip(spottag_id_list).each do |tag_id, spottag_id|
            micropost_tag = Tag.find_by(id: tag_id)
            self.tags << micropost_tag
            micropost_spot = Spottag.find_by(id: spottag_id)
            self.spottags << micropost_spot
        end
    end
    # 引数として受け取ったidの配列に対してeachメソッドをかけて
    # それぞれのidに該当するTagオブジェクトを探し出し、
    # self.tagsに格納(登録)していきます。
    
 
  private

    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end

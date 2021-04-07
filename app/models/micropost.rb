class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true
  
  validate :picture_size

 # マイクロポストは1人のユーザーと紐づく
 # ユーザーID・コンテンツが空白の場合はマイクロポストできないように
 
 private
 
  def picture_size
    if picture.size > 5.megabytes
      error.add(:picture, "should be less than 5MB")
    end
  end

end

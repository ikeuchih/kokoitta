class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  
 # マイクロポストは1人のユーザーと紐づく
 # ユーザーID・コンテンツが空白の場合はマイクロポストできないように

end

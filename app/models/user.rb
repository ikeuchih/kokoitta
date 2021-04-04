class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  # ユーザーに対してマイクロポストを複数紐づけるよ
  # ユーザーが削除されれば一緒にマイクロポストも削除します
  
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    before_save { self.email = email.downcase }
# 　  validates :username,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
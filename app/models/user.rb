class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  # ユーザーに対してマイクロポストを複数紐づけるよ
  # ユーザーが削除されれば一緒にマイクロポストも削除します
  
  has_many :relationships
  # relationshipsとユーザーの関連付け
  
  has_many :followings, through: :relationships, source: :follow
  # has_many :followingsとありますが、followingクラスはないけど設定
  # 中間テーブルはrelationshipsだよってthroughで設定
  # source: :followはrelationshipsテーブルのfollow_idを参考にして、
  # followingsモデルにアクセスしてね
  
  # まとめるとuser.followings と打つだけで、
  # user が中間テーブル relationships を取得し、
  # その1つ1つの relationship のfollow_idから、
  # 「フォローしている User 達」を取得できる
  
  has_many :reverse_of_relationships, class_name: 'Relationships', foreign_key: 'follow_id'
  # reverse_of_relationshipsと命名。relationshipsの逆方向だよってこと
  # class_name :'Relationship'でrelationshipモデルのことだよと設定
  # foreign_key: 'follow_id'は
  # relationshipsテーブルにアクセスするときはfollow_idを入り口としてね
  
  has_many :followers, through: :reverse_of_relationships, source: :user
  # followersを命名
  # 中間テーブルはreverse_of_relationshipsと設定
  # 出口はuser_id。userテーブルから自分のフォロワーユーザーをとってきてね
  
  
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
    before_save { self.email = email.downcase }
# 　  validates :username,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    validates :profile, length: { maximum: 250 }
    mount_uploader :image, ImageUploader
    
    
    def feed
      Micropost.where("user_id = ?", id)
    end
    
    def follow(other_user)
      unless self == other_user
        self.relationships.find_or_create_by(follow_id: other_user.id)
      end
    end
    # フォローしようとしているのは自分自身でないよね
    # 見つかればフォロー関係（relathion）を返し
    # 関係が見つからなければ、
    # self.relationships.create(follow_id: other_user.id) として
    # フォロー関係を保存(create = new + save)することができる
    # つまりfollowメソッドでは
    # 自分自身をフォローすることを防ぐのと
    # フォローが重複して保存されることがなくなります
    
    def unfollow(other_user)
      relationship = self.relationships.find_by(follow_id: other_user.id)
      relationship.destroy if relationship
    end
    # フォロー関係があればアンフォローさせる構文
    
    def following?(other_user)
      self.followings.include?(other_user)
    end
    # self.followings によりフォローしている User 達を取得し、
    # include?(other_user) によって other_user が含まれていないかを確認
    
end
class Relationship < ApplicationRecord
    belongs_to :user
    belongs_to :follow, class_name: 'User'
    
    validates :user_id, presence: true
    validates :follow_id, presence: true
end

# class_name: 'User'と設定することで存在しないfollowクラスを
# 参照することを防ぎ、Userクラスであることを明示
# 要はfollowモデルなんて存在しないので、userモデルにbelongs_toしてね！
# バリデーションはどちらか一方でもないと保存されないように！


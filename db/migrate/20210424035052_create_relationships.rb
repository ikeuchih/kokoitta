class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      
      t.timestamps
      
      t.index [:user_id, :follow_id],unique: true
    end
  end
end

# 外部キーとしての設定をするためにオプションは「foreign_key: true」
# follow_idの参照先のテーブルはusersテーブルにしてあげたいので、{to_table: :users}
# t.index [:user_id, :follow_id], unique: true は、 
# user_id と follow_id のペアで重しないようにするデータベースの設定

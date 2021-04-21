class CreateMicropostSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :micropost_spots do |t|
      t.references :micropost, foreign_key: true
      t.references :spottag, foreign_key: true

      t.timestamps
    end
  end
end

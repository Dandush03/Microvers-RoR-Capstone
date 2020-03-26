class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, references: :users, foreign_key: { to_table: :users }
      t.references :followed, references: :users, foreign_key: { to_table: :users }
    end
  end
end

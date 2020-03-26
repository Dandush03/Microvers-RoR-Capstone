class CreateCultures < ActiveRecord::Migration[6.0]
  def change
    create_table :cultures do |t|
      t.string :text

      t.references :user, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

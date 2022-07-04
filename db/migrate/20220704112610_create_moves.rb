class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :notation
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.string :fen

      t.timestamps
    end
  end
end

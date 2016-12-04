class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :report, foreign_key: true
      t.string :code, limit: 24, index: true, unique: true
      t.text :content

      t.timestamps
    end
  end
end

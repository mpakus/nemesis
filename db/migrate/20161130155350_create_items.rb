class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :generator, foreign_key: true
      t.references :report, foreign_key: true
      t.text :boards
      t.text :lists
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end

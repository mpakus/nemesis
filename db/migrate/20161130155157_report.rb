class Report < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.datetime :deleted_at, index: true
      t.references :account, foreign_key: true
      t.timestamps
    end
  end
end

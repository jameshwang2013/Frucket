class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :content
      t.references :bucket, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

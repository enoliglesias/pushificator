class CreateSendings < ActiveRecord::Migration
  def change
    create_table :sendings do |t|
      t.references :notification, index: true, foreign_key: true
      t.string :type
      t.timestamp :sending_at

      t.timestamps null: false
    end
  end
end

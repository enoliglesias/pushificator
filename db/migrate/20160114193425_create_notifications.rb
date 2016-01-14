class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :message
      t.timestamp :sent_at

      t.timestamps null: false
    end
  end
end

class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :uuid
      t.string :model
      t.string :manufacturer
      t.string :platform
      t.string :version

      t.timestamps null: false
    end
  end
end

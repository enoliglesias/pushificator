class AddTokenToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :token, :string
  end
end

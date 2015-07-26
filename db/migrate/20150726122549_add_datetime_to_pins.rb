class AddDatetimeToPins < ActiveRecord::Migration
  def change
    add_column :pins, :datetime, :datetime
  end
end

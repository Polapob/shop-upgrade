class AddDefaultValueToLockVersion < ActiveRecord::Migration[7.0]
  def change
    change_column_default :items, :lock_version, 0
  end
end

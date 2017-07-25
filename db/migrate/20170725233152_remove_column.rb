class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :checks, :check_id
  end
end

class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :employees, :federal_filing_status, :string
    change_column :employees, :state_filing_status, :string
  end
end

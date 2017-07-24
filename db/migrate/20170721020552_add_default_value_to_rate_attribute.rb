class AddDefaultValueToRateAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :employees, :admin, :string, :default => "No"
    change_column :employees, :rate, :integer, :default => 12.00
    change_column :employees, :status, :boolean, :default => true 
    change_column :employees, :paid_by, :string, :default => "check"
  end
end

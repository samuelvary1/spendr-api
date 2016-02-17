class AddMonthlySalaryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :monthly_salary, :integer
  end
end

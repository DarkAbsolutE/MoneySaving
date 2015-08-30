class UpdateEmployeeAddPhoto < ActiveRecord::Migration
  def change
    add_column :employees, :photo_url, :string
  end
end

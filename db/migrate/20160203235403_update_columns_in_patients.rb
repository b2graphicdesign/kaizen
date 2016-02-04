class UpdateColumnsInPatients < ActiveRecord::Migration
  def change
    rename_column :patients, :phone_number, :phone
  end
end

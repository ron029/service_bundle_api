class AddColumnToTimeslot < ActiveRecord::Migration[6.1]
  def change
    add_column :time_slot, :duration, :integer # Assuming you want to store the duration in minutes
    add_column :time_slot, :interval, :integer # Assuming you want to store the interval in minutes
  end
end

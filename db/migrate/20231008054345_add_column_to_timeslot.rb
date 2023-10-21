class AddColumnToTimeslot < ActiveRecord::Migration[6.1]
  def change
    add_column :time_slots, :duration, :integer # Assuming you want to store the duration in minutes
    add_column :time_slots, :interval, :integer # Assuming you want to store the interval in minutes
  end
end

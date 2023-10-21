class AddColumnToTimeslot < ActiveRecord::Migration[6.1]
  def change
    add_column :time_slots, :duration, :integer unless column_exists?(:time_slots, :duration)
    add_column :time_slots, :interval, :integer unless column_exists?(:time_slots, :interval)
  end
end


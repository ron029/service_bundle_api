class AddDurationAndIntervalToTimeSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :time_slots, :duration, :integer
    add_column :time_slots, :interval, :integer
  end
end

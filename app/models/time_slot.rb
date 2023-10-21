class TimeSlot < ApplicationRecord
  belongs_to :service
  before_validation :print_attributes_before_save

  validates :duration, :interval, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :start_date, :end_date, :start_time, :end_time, presence: true
  validates_date :start_date, on_or_after: -> { Date.current }
  validates_date :end_date, on_or_after: :start_date

  validates_time :start_time, after: '00:00am', before: '11:59pm'
  validates_time :end_time, after: :start_time, before: '11:59pm'

  def print_attributes_before_save
    puts "Start Date: #{start_date}"
    puts "End Date: #{end_date}"
    puts "Start Time: #{start_time}"
    puts "End Time: #{end_time}"
    puts "Capacity: #{capacity}"
  end
end

module TimeSlots
  class Persistence
    attr_reader :current_user

    def initialize(current_user = nil)
      @current_user = current_user
    end

    def create(params)
      TimeSlot.create!(
        service_id: params[:service_id],
        start_date: params[:start_date],
        end_date: params[:end_date],
        start_time: params[:start_time],
        end_time: params[:end_time],
        capacity: params[:capacity],
        duration: params[:duration],
        interval: params[:interval]
      )
    end

    def update(params)
      time_slot = TimeSlot.find(params[:id])
      time_slot.update(
        service_id: params[:service_id],
        start_date: params[:start_date],
        end_date: params[:end_date],
        start_time: params[:start_time],
        end_time: params[:end_time],
        capacity: params[:capacity],
        duration: params[:duration],
        interval: params[:interval]
      )
      time_slot
    end

    def delete(params)
      ts = TimeSlot.find_by(id: params[:id])
      ts.destroy
    end

    def check_email(params)
      user = User.find_by(email: params[:email])
      user.nil? ? false : true
    end
  end
end

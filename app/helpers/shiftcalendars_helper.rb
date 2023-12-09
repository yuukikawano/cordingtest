module ShiftcalendarsHelper
    def search_shifts_on_day(day)
        shifts_on_day = Shiftcalendar.where(attendtime: day.beginning_of_day..day.end_of_day)
        users_on_day  = shifts_on_day.pluck(:user_id)
        users_list = []
        users_on_day.each do |user_id|
          user_name = User.find(user_id).name
          users_list.push(user_name)
        end 
        users_list
    end

    def shift_number_on_day(day)
        shifts_on_day = Shiftcalendar.where(attendtime: day.beginning_of_day..day.end_of_day)
        users_on_day = shifts_on_day.pluck(:user_id)
        num_kitchen = 0 
        num_hall = 0 
        users_on_day.each do |user_id|
          user = User.find(user_id)
          if user.occupation == "hall"
            num_hall += 1 
          elsif user.occupation == "kitchen"
            num_kitchen += 1 
          end 
        end  
        result = ["hall#{num_hall}, kitchen#{num_kitchen}"]
    end 
end

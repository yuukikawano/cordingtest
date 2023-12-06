module ShiftcalendarsHelper
    def search_shifts_on_day(day)
        formatted_date = day.to_date.strftime("%Y-%m-%D")
        shifts_on_day = Shiftcalendar.where("strftime('%Y-%m-%D',attendtime) = ?", formatted_date)
        user_on_day  = shifts_on_day.pluck(:user_id)
        user_on_day 
    end 
end

class Shiftcalendar < ApplicationRecord
    def calculate_fee(record,user_id)
        hourlywage = User.find(user_id).hourlewage
        if record.attributes.values.none?(&:nil?)
          working_time_seconds = (record.attendtime - record.leavetime) - (record.restend - record.reststart)
          working_time_hour = working_time_seconds / 3600
          fee = working_time_hour * hourlywage 
          fee 
        else  
          "勤怠処理を完了させてください"
        end 
    end 

    def search_shifts_on_day(day)
        shits_on_day = Shiftcalendar.where("DATE(attendtime) = ?, day.to_date")
        shifts_on_day
    end 
end

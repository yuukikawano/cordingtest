class Shiftcalendar < ApplicationRecord
    def calculate_fee(attend,leave,user_id)
        hourlywage = User.find_by(user_id)&.hourlewage
        total_fee = (leave - attend) * (hourlewage.to_f/60)
        total_fee 
    end 

    def search_shifts_on_day(day)
        shits_on_day = Shiftcalendar.where("DATE(attendtime) = ?, day.to_date")
        shifts_on_day
    end 
end

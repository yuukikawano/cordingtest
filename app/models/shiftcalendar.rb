class Shiftcalendar < ApplicationRecord
    def calculate_fee(record,user_id)
        if User.find(user_id).hourlewage.present? 
          hourlywage = User.find(user_id).hourlewage
          if record.attributes.values.none?(&:nil?)
            working_time_seconds = (record.attendtime - record.leavetime) - (record.restend - record.reststart)
            working_time_hour = working_time_seconds / 3600
            fee = working_time_hour * hourlywage 
            "#{fee.round}円"
          else  
            "勤怠処理を完了させてください"
          end 
        else   
          "時給・職種を設定してもらってください" 
        end 
    end 
end

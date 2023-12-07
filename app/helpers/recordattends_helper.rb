module RecordattendsHelper
    def calculate_fee(record,user_id)
        hourlywage = User.find(user_id).hourlewage
        if record.attributes.values.none?(&:nil?)
          working_time_seconds = (record.leavetime - record.attendtime) - (record.restend - record.reststart)
          working_time_hour = working_time_seconds / 3600
          fee = working_time_hour * hourlywage 
          fee 
        else  
          "勤怠処理を完了させてください"
        end 
    end 

    def workstatus(current_user_id)
      @record = Recordattend.where(user_id: current_user_id).order(id: :desc).first
      if @record.leavetime == nil
        if @record.reststart == nil
          "working"
        else  
          if @record.restend == nil
            "resting"
          else  
            "working"
          end 
        end
      else 
        "able to start working"  
      end 
    end 

end

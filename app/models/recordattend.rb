class Recordattend < ApplicationRecord
  belongs_to :user

  # def workstatus(current_user_id)
  #   @record = Recordattend.find_by(user_id: current_user_id)
  #   if @record.leavetime.nil? 
  #     if @record.reststart.nil? 
  #       "working"
  #     else  
  #       if @record.restend.nil? 
  #         "resting"
  #       else  
  #         "working"
  #       end 
  #     end
  #   else 
  #     "able to start working"  
  #   end 
  # end 
end

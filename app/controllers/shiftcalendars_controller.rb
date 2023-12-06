class ShiftcalendarsController < ApplicationController
  helper ShiftcalendarHelper
  def create
     @shift = Shiftcalendar.create(shift_params)
     @shift.user_id = current_user.id 
     @shift.occupation = current_user.occupation 
     @shift.save 
     redirect_to 
  end 

  private 
    
    def shift_params 
      params.require(:shiftcalendar).permit(:attendtime, :leavetime)
    end 

end

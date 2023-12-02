class RecordattendsController < ApplicationController

    def index 
      @record = Recordattend.find_by(user_id: current_user.id)
      if @record == nil 
        @record = Recordattend.create(user_id: current_user.id, attendtime: Time.now)
      end
    end 

    def editrecord
      case params[:type]
      when 'startworking'
        startworking
      when 'finishworking'
        finishworking
      when 'finishresting'
        finishresting 
      when 'startresting'
        startresting 
      end 
    end 

    def startworking
      @record = Recordattend.create(user_id: current_user.id, attendtime: Time.now)
      @record.save 
      redirect_to recordattends_path
    end 

    def finishworking
      @record = Recordattend.find_by(user_id: current_user.id, leavetime: nil)
      @record.update(leavetime: Time.now)
      redirect_to recordattends_path
    end 

    def startresting
      @record = Recordattend.where(user_id: current_user.id).where.not(attendtime: nil).where(leavetime: nil)
      @record.update(reststart: Time.now)
      redirect_to recordattends_path
    end 

    def finishresting
      @record = Recordattend.where(user_id: current_user.id).where.not(attendtime: nil).where.not(reststart: nil)
      @record.update(restend: Time.now)
      redirect_to recordattends_path
    end 
end

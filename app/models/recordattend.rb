class Recordattend < ApplicationRecord
  def startrest? 
    if attendtime.present? && leavetime.nil?
      true 
    end 
  end 
  
  def finishrest? 
    if attendtime.present? && reststart.present?
      true 
    end
  end 

  def finishwork? 
    if attendtime.present? && leavetime.nil? 
      true 
    end
  end 
end

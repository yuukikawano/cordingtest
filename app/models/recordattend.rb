class Recordattend < ApplicationRecord
  belongs_to :user
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

  def calculate_fee(attend,leave,user_id)
    hourlywage = User.find_by(user_id).hourlewage
    total_fee = (leave - attend) * hourlewage/60
    total_fee 
  end 
end

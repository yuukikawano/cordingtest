module RecordattendsHelper
    def calculate_fee(attend,leave,user_id)
        hourlywage = User.find(user_id).hourlewage
        if leave != nil && attend != nil
          total_fee = (leave - attend) * hourlywage/60
          total_fee 
        else  
          0 
        end 
    end 
end

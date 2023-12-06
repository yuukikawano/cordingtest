class AddCalendar < ActiveRecord::Migration[7.0]
  def change
    create_table :shiftcalendars do |t|
      t.integer  :user_id
      t.text  :occupation 
      t.datetime  :attendtime
      t.datetime   :leavetime
      t.timestamps
    end
  end
end

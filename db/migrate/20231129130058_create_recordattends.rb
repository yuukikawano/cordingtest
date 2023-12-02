class CreateRecordattends < ActiveRecord::Migration[7.0]
  def change
    create_table :recordattends do |t|
      t.references :user, foreign_key: true
      t.datetime   :attendtime
      t.datetime   :leavetime
      t.datetime   :reststart
      t.datetime   :restend
      t.timestamps
    end
  end
end

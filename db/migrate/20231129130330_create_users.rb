class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string     :name
      t.string     :occupation
      t.integer    :hourlewage
      t.timestamps
    end
  end
end

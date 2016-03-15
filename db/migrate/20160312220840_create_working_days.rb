class CreateWorkingDays < ActiveRecord::Migration
  def change
    create_table :working_days do |t|
      t.belongs_to :business, index: true
      t.string :day
      t.time  :open
      t.time  :close
      
      t.timestamps null: false
    end
  end
end

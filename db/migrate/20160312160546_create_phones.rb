class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.belongs_to :business, index: true
      t.string     :phone_type
      t.string     :phone_number
      
      t.timestamps null: false
    end
  end
end

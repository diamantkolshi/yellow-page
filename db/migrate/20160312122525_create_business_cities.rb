class CreateBusinessCities < ActiveRecord::Migration
  def change
    create_table :business_cities do |t|
      t.belongs_to :business, index: true
      t.belongs_to :city,  index: true       

      t.timestamps null: false
    end
  end
end

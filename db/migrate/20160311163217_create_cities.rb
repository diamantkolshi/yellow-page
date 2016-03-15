class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.belongs_to :country, index: true
      t.string     :name
      t.integer    :prefix
      
      t.timestamps null: false
    end
  end
end

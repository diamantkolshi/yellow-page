class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :city, index: true
      t.string  :name
      t.float   :latitude
      t.float   :longitude

      t.timestamps null: false
    end
  end
end

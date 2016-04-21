class CreateBusinessAddresses < ActiveRecord::Migration
  def change
    create_table :business_addresses do |t|
      t.belongs_to :business, index: true
      t.belongs_to :address, index: true

      t.timestamps null: false
    end
  end
end

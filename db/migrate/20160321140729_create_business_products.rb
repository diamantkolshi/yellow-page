class CreateBusinessProducts < ActiveRecord::Migration
  def change
    create_table :business_products do |t|
      t.belongs_to :business, index: true
      t.belongs_to :product, index: true
      t.string :description
      t.decimal :price
      t.string :image

      t.timestamps null: false
    end
  end
end

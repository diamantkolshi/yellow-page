class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.belongs_to :business, index: true
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end

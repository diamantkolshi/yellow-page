class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :type, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end

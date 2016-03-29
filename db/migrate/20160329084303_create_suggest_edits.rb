class CreateSuggestEdits < ActiveRecord::Migration
  def change
    create_table :suggest_edits do |t|
      t.boolean :business_closed
      t.string :name
      t.string :address
      t.string :city
      t.string :established
      t.integer :zip_code
      t.string :business_tel
      t.string :fax_number
      t.text   :opening_hours
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :google

      t.timestamps null: false
    end
  end
end

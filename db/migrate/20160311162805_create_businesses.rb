class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string  :name
      t.string  :aka
      t.string  :logo
      t.text    :description
      t.string  :location
      t.string  :location
      t.integer :zip_code
      t.string  :website
      t.string  :establidhed
      t.string  :email
      t.integer :nr_of_employess
      t.string  :payment_mathod          

      t.timestamps null: false
    end
  end
end

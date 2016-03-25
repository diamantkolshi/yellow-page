class CreateSuggestBusinesses < ActiveRecord::Migration
  def change
    create_table :suggest_businesses do |t|
      	t.string :name
      	t.string :email
      	t.string :tel 
      	t.text :message
      	t.boolean :confirm, default: false
      	
      	t.timestamps null: false
    end
  end
end

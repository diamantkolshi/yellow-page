class CreateSuggestPhotos < ActiveRecord::Migration
  def change
    create_table :suggest_photos do |t|
    	t.integer :user_id
    	t.integer :business_id
    	t.string :source 
    	t.boolean :confirm, default: false

      t.timestamps null: false
    end
  end
end

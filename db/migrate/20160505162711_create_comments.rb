class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content
    	
    	t.belongs_to :business, index: true, foreign_key: true
      	t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

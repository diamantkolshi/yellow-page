class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.belongs_to :business, index: true
      t.string     :name
      t.string     :source, length: 50

      t.timestamps null: false
    end
  end
end

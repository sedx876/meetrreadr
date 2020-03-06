class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :tag 
      t.references :book
      t.timestamps
    end
  end
end

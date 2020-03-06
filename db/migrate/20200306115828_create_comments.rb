class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :body
      t.references :book
      t.timestamps
    end
  end
end

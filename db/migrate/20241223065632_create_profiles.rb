class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.integer :age
      t.string :gender
      t.string :phone_number
      t.string :profile_pic
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

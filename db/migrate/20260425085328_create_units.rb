class CreateUnits < ActiveRecord::Migration[8.1]
  def change
    create_table :units do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :room_number
      t.integer :floor
      t.decimal :sqm
      t.decimal :price
      t.string :unit_type
      t.string :facing
      t.string :status

      t.timestamps
    end
  end
end

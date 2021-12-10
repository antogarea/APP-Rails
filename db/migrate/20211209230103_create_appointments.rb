class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :professional, null: false, foreign_key: { on_delete: :cascade }
      t.datetime :date, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.integer :phone, null: false
      t.string :notes

      t.timestamps
    end
  end
end
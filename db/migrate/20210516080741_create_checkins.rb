class CreateCheckins < ActiveRecord::Migration[6.0]
  def change
    create_table :checkins do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.references :pulse_status, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end

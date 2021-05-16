class CreatePulseStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :pulse_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end

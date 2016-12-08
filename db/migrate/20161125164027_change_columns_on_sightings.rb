class ChangeColumnsOnSightings < ActiveRecord::Migration[5.0]
  def change
    remove_column :sightings, :date_time
    add_column :sightings, :last_seen_date, :date
    add_column :sightings, :last_seen_time, :time
    add_column :sightings, :color, :string
    add_column :sightings, :size, :string
  end
end

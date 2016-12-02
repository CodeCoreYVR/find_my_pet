class RemoveLastSeenAtAndAddAddress < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :last_seen_at
    remove_column :sightings, :last_seen_at
    add_column :pets, :address, :string
    add_column :sightings, :address, :string
  end
end

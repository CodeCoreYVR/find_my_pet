class AddSlugToSightings < ActiveRecord::Migration[5.0]
  def change
    add_column :sightings, :slug, :string
    add_index :sightings, :slug
  end
end

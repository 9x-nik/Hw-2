class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.integer :movie_name
      t.integer :person_name
      t.integer :character_name

      t.timestamps
    end
  end
end

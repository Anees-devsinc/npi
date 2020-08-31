class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :request
      t.json :response
      t.string :npi_number
      t.integer :search_count, default: 1

      t.timestamps
    end
  end
end

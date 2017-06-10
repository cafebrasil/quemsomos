class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities, id: :uuid, default: "uuid_generate_v4()", force: true do |t|
      t.string :name
      t.uuid :state_id

      t.timestamps
    end
  end
end

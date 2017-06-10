class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states, id: :uuid, default: "uuid_generate_v4()", force: true do |t|
      t.string :name, null: false
      t.uuid :country_id, null: false

      t.timestamps
    end
  end
end

class CreateCitableRecords < ActiveRecord::Migration
  def change
    create_table :citable_records do |t|
      t.string :data
      t.string :format

      t.timestamps null: false
    end
  end
end

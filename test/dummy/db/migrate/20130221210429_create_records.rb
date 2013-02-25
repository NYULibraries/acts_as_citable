class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :data
      t.string :format

      t.timestamps
    end
  end
end

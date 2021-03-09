class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.jsonb :payload
      t.references :bin

      t.timestamps
    end
  end
end

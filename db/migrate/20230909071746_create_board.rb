class CreateBoard < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string    :email, null: false, limit: 256
      t.string    :name, null: false, limit:256
      t.integer   :width, null: false, default: 0
      t.integer   :height, null: false, default: 0
      t.integer   :num_of_mine, null: false, default: 0
      t.jsonb     :board_data, default: [], array: true

      t.timestamps
    end
  end
end

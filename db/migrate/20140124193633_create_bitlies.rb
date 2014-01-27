class CreateBitlies < ActiveRecord::Migration
  def change
    create_table :bitlies do |t|
      t.string :name
      t.string :random
      t.string :url

      t.timestamps
    end
  end
end

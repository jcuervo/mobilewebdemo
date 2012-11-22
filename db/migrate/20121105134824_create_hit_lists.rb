class CreateHitLists < ActiveRecord::Migration
  def change
    create_table :hit_lists do |t|
      t.string :agent
      t.string :summary
      t.string :status

      t.timestamps
    end
  end
end

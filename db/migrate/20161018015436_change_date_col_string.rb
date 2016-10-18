class ChangeDateColString < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :last_smoke
    end
  end
end

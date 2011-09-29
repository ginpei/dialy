class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :body
      t.integer :cash
      t.integer :suica

      t.timestamps
    end
  end
end

class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.belongs_to :senf_file
      t.string :number
      t.timestamps
    end

    add_index :numbers, :senf_file
  end
end

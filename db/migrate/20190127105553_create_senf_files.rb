class CreateSenfFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :senf_files do |t|
      t.string :runner # 検索した人
      t.string :path # ファイルパス
      t.string :file_name # ファイル名
      t.string :extension # 拡張し
      t.integer :size # ファイルサイズ
      t.boolean :exist # カード情報が存在したか
      t.timestamps
    end

    add_index :senf_files, :runner
    add_index :senf_files, :exist
  end
end

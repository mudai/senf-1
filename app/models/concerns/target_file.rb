class TargetFile
  #
  def create_targets(dir_path)
    create_list(dir_path) do |path|
      file_name = File.basename(path, "*") # ファイル名
      extension = File.extname(path) # 拡張子
      size = File.size(path)
      exist = false # 検索前は必ずfalse
      SenfFile.create!(
        path: path,
        file_name: file_name,
        extension: extension,
        size: size,
        exist: exist
      )
    end
  end

  private
  # ファイルの一覧を作成する
	def create_list(dir_path)
		Dir.foreach(dir_path) do |x|
			next if x == '.' or x == '..'
			new_path = File.join(dir_path, x)
			if File.directory?(new_path) then
				create_list(new_path) {|x| yield x }
			else
				yield new_path
			end
		end
	rescue => e
		puts e.inspect
		nil
	end
end

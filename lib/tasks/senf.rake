namespace :senf do
  desc '引数で渡したパスからファイル一覧を作成'

  task :create_targets, ['path'] => :environment do |task, args|
    tf = TargetFile.new
    tf.create_targets(args[:path])
  end

  task :clear_targets => :environment do
    SenfFile.delete_all
  end
end

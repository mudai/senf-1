class SenfFile < ApplicationRecord

  # カード情報が無いか検索する # delayed jobで呼ぶ
  def scan
    resource = Tika::Resource.new(path)
    puts resource.text
  end


  private
  def scanner(extension)
  end
end

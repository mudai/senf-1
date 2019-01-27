class SenfFile < ApplicationRecord

  has_many :numbers
  # カード情報が無いか検索する # delayed jobで呼ぶ
  def scan
    # 5mb以上はいったんスキップ
    # 一覧をつくってから除外する拡張子のリストを作る
    # 正規表
    str = get_string(self)
    str.each_line do |line|
      if m = Regexp.compile(/[3-6][0-9]{3}([-\. \|])[0-9]{4}\1[0-9]{4}\1[0-9]{4}/).match(line)
        Rails.logger.debug(m)
        # マッチした場合
        p card_no = m[0].strip.gsub(/[-\. \|]/,"")
        if CreditCardValidator::Validator.valid?(card_no)
          # カード情報をロギングする
          Rails.logger.info("カード情報が見つかりました。id: #{self.id}, path: #{self.path}, card_no: #{card_no}")
          ActiveRecord::Base.transaction do
            self.numbers.create!(number: card_no)
            self.update!(exist: true)
          end
        end
      end
    end
  end

  def get_string(senf_file)
    case senf_file.extension
    when "txt", "sql", "", nil # テキスト系のファイル
      File.open(senf_file.path).read
    when "msi", "exe" # スキップ系のファイル
    else
      Tika::Resource.new(senf_file.path).text
    end
  rescue => e
    puts e.inspect
    ""
  end
end

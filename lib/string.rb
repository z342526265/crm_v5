class String
  #得到字符串的下一个编号，是对字符串中数值区域的值的增加，
  #如果该字符串没有数值区域，那么返回原字符串
  #例如
  # 'abc'.next_number         -> abc
  # 'abc100'.next_number      ->abc101
  # '100'.next_number         ->101
  # '100abc'.next_number      ->101abc
  # '0100abc'.next_number     ->0101abc
  # '0099abc'.next_number     ->0100abc
  # "abc100".next_number(10)  ->"abc110"
  # "100abc".next_number(10)  ->"110abc"
  # "100abc100".next_number(10)  ->"100abc110"
  def next_number(qty=1)
    self.reverse.sub(/(0*)\d+/) { |match| (match.reverse.to_i+qty.to_i).to_s.rjust(match.length, "0").reverse }.reverse
    #    next_number = self.reverse.sub(/(0*)\d+/) { |match| (match.reverse.to_i+qty.to_i).to_s.rjust(match.length,"0").reverse}.reverse
    #    next_number = next_number.succ if next_number == self
    #    next_number
  end



  def utf8_to_gb2312
    encode_convert(self, "gb2312", "UTF-8")
  end

  def gb2312_to_utf8
    encode_convert(self, "UTF-8", "gb2312")
  end

  def utf8?
    begin
      utf8_arr = self.unpack('U*')
      true if utf8_arr && utf8_arr.size > 0
    rescue
      false
    end
  end

  private
  def encode_convert(s, to, from)
    require 'iconv'
    begin
      converter = Iconv.new(to, from)
      converter.iconv(s)
    rescue
      s
    end
  end


end
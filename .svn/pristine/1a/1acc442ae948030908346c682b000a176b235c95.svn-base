# encoding: utf-8
class Array
  #当前数组中元素是否全部包含在参数数组中,是返回true,若有一个不是，则返回false
  def is_child?(arr=[])
    return false unless arr.is_a?(Array)
    self.each do |a|
      return false unless arr.include? a
    end
  end
end
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?

    result = 0
    self.each_with_index do |el, idx|
      if el.is_a?(Fixnum)
        result += "#{el}#{idx}".to_i.hash
      else
        result += "#{el.to_s.hash}#{idx}".to_i.hash
      end
    end

    result.hash
  end
end
#
class String
  def hash
    letters = split("")

    return 0.hash if letters.empty?

    result = 0
    letters.each_with_index do |el, idx|
      result += "#{idx}#{el.ord}".to_i.hash
      result = result.hash
    end

    result.hash

  end
end

class Hash
  def hash
    key_str = self.keys.map {|el| el.to_s}
    value_str = self.values.map{|el| el.to_s}

    (key_str + value_str).sort.hash
  end
end

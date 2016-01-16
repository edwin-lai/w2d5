class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    first.nil? && last.nil?
  end

  def get(key)
    link = first
    until link.nil? || link.key == key
      link = link.next
    end

    return nil if link.nil?
    link.val
  end

  def include?(key)
    link = first

    until link.nil?
      return true if link.key == key
      link = link.next
    end

    false
  end

  def insert(key, val)
    link = Link.new(key, val)

    if first.nil?
      @head = link
    else
      @tail.next = link
      link.prev = @tail
    end

    @tail = link
  end

  def remove(key)
    link = first

    until link.nil? || link.key == key
      link = link.next
    end

    return nil if link.nil?

    unless link.nil?
      link.prev.next = link.next unless link.prev.nil?
      link.next.prev = link.prev unless link.next.nil?
      @head = link.next if first == link
      @tail = link.prev if last == link
    end
  end

  def each(&prc)
    link = first

    until link.nil?
      prc.call(link.key, link.val)
      link = link.next
    end

    self
  end
  #
  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

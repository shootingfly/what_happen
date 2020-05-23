abstract class Object
  def what_happen?(expect) : Array(String)
    array = [] of String
    generate_what_happen_by_ancestors
    generate_what_happen_by_self
    array.uniq
  end

  def <=>(other)
    return nil if !other.is_a?(self.class)
    other <=> self
  end
end

abstract struct Number
  def <=>(other) : Int32?
    return nil if !other.is_a?(Number) # Crystal did not limit the type of `other` in Number
    # NaN can't be compared to other numbers
    return nil if self.is_a?(Float) && self.nan?
    return nil if other.is_a?(Float) && other.nan?

    self > other ? 1 : (self < other ? -1 : 0)
  end
end

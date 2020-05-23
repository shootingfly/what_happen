require "./what_happen/**"

# Tells you what happen from x to y
#
# ```
# what_happen(from: false, to: "false")   # => ["to_s", "inspect", "pretty_inspect"]
# what_happen(from: 1, to: -1)            # => ["-"]
# what_happen(from: {1, 2, 3}, to: 1)     # => ["first", "first?", "min", "min?"]
# what_happen(from: {a: 1}, to: {:a})     # => ["keys", "sorted_keys"]
# what_happen(from: [1, 2], to: 1)        # => ["first", "first?", "min", "min?"]
# what_happen(from: [1, 2, 3], to: 3)     # => ["size", "last", "last?", "max", "max?"]
# what_happen(from: "hello", to: "HELLO") # => ["upcase"]
# what_happen(from: "Hello", to: "hello") # => ["downcase", "underscore"]
# ```
def what_happen(from, to) : Array(String)
  from.what_happen?(to)
end

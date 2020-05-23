module WhatHappen
  SKIP_METHODS = ["transpose", "to_h", "sample", "sum", "product"]
end

macro generate_what_happen_by_self
  {% begin %}
    {% methods = @type.methods.select { |x| (x.args.size == 0 || x.args.all? { |c| !c.default_value.is_a?(Nop) || c.name == "" }) && !x.accepts_block? }.map(&.name) %}
    {% for m in methods %}
      {% if !WhatHappen::SKIP_METHODS.includes?(m.stringify) %}
        array << {{ m.stringify }} if expect == self.{{ m.id }} rescue false
      {% end %}
    {% end %}
  {% end %}
end

macro generate_what_happen_by_ancestors
  {% begin %}
    {% for k in @type.ancestors %}
    {% methods = k.methods.select { |x| (x.args.size == 0 || x.args.all? { |c| !c.default_value.is_a?(Nop) || c.name == "" }) && !x.accepts_block? }.map(&.name) %}
      {% for m in methods %}
        {% if !WhatHappen::SKIP_METHODS.includes?(m.stringify) %}
          array << {{ m.stringify }} if expect == self.{{ m.id }} rescue false
        {% end %}
      {% end %}
    {% end %}
  {% end %}
end

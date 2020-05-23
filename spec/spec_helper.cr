require "spec"
require "../src/what_happen"

macro after(method, expression, *, become)
  what_happen(from: {{ expression }}, to: {{ become }}).should contain {{ method.id.stringify }}
end

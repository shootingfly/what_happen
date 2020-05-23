require "./spec_helper"

describe WhatHappen do
  it "full example" do
    what_happen(from: false, to: "false").should eq ["to_s", "inspect", "pretty_inspect"]
    what_happen(from: 1, to: -1).should eq ["-"]
    what_happen(from: {1, 2, 3}, to: 1).should eq ["first", "first?", "min", "min?"]
    what_happen(from: {a: 1}, to: {:a}).should eq ["keys", "sorted_keys"]
    what_happen(from: [1, 2], to: 1).should eq ["first", "first?", "min", "min?"]
    what_happen(from: [1, 2, 3], to: 3).should eq ["size", "last", "last?", "max", "max?"]
    what_happen(from: "hello", to: "HELLO").should eq ["upcase"]
    what_happen(from: "Hello", to: "hello").should eq ["downcase", "underscore"]
  end
end

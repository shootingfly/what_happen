require "./spec_helper"
require "big"

describe WhatHappen do
  it "not work with SKIP_METHODS" do
    # See `WhatHappen::SKIP_METHODS`
    what_happen(from: [1, 2, 3], to: 5).should eq [] of String    # product
    what_happen(from: [1, 2, 3], to: 6).should eq [] of String    # sum
    what_happen(from: [1, 2, 3, 4], to: 2).should eq [] of String # sample
  end

  it "works with Bool" do
    after to_s, true, become: "true"
  end

  it "works with Enumerable" do
    after any?, [1, 2, 3], become: true
    after any?, ["1", 2, 3], become: true
    after first, [1, 2, 3], become: 1
    after first?, [1, 2, 3], become: 1
    after max, [1, 2, 3], become: 3
    after max?, [1, 2, 3], become: 3
    after min, [1, 2, 3], become: 1
    after min?, [1, 2, 3], become: 1
    after minmax, [1, 2, 3], become: {1, 3}
    after minmax?, [1, 2, 3], become: {1, 3}
    after none?, [1, 2, 3], become: false
    after one?, [1, 2, 3], become: false
    after size, [1, 2, 3], become: 3
    after tally, [1, 2, 3], become: {1 => 1, 2 => 1, 3 => 1}
    after to_a, [1, 2, 3], become: [1, 2, 3]
    after to_a, [] of Int32, become: [] of Int32
    after to_set, [1, 2, 3], become: Set{1, 2, 3}
  end

  it "works with String" do
    after ascii_only?, "你好", become: false
    after blank?, "hello_world", become: false
    after bytesize, "你好", become: 6
    after bytes, "你好", become: [228, 189, 160, 229, 165, 189]
    after camelcase, "hello_world", become: "HelloWorld"
    after capitalize, "hello_world", become: "Hello_world"
    after chars, "hello_world", become: ['h', 'e', 'l', 'l', 'o', '_', 'w', 'o', 'r', 'l', 'd']
    after chomp, "hello_world\r\n", become: "hello_world"
    after clone, "hello_world", become: "hello_world"
    after codepoints, "你好", become: [20320, 22909]
    after downcase, "hEllo", become: "hello"
    after empty?, "", become: true
    after empty?, " ", become: false
    after has_back_references?, "hel\\lo", become: 3
    after hexbytes, "0102031aff", become: Bytes[1, 2, 3, 26, 255]
    after hexbytes?, "0102031aff", become: Bytes[1, 2, 3, 26, 255]
    after lstrip, "\rhello_world\r\n", become: "hello_world\r\n"
    after presence, "hello_world", become: "hello_world"
    after rchop, "hello_world\r\n", become: "hello_world\r"
    after rchop?, "hello_world\r\n", become: "hello_world\r"
    after reverse, "hello_world", become: "dlrow_olleh"
    after rstrip, "    hello_world    ", become: "    hello_world"
    after size, "hello_world", become: 11
    after split, "hello world", become: ["hello", "world"]
    after squeeze, "hello    world", become: "helo world"
    after strip, "   hello world   ", become: "hello world"
    after succ, "hello_world", become: "hello_worle"
    after to_big_d, "1212341515125412412412421", become: BigDecimal.new("1212341515125412412412421")
    after to_big_f, "1234.0", become: 1234.0
    after to_big_i, "1212341515125412412412421", become: BigInt.new("1212341515125412412412421")
    after to_f, "123.45e1", become: 1234.5
    after to_i, "123", become: 123
    after to_s, "123", become: "123"
    after underscore, "HelloWorld", become: "hello_world"
    after upcase, "hEllo", become: "HELLO"
    after valid_encoding?, "hello_world", become: true
  end

  it "works With Number" do
    after "-", 1, become: -1
  end

  it "works with NamedTuple" do
    after keys, {a: 1, b: "2"}, become: {:a, :b}
    after sorted_keys, {a: 1}, become: {:a}
  end

  it "works with Tuple" do
    after first, {1, :a, "3"}, become: 1
    after first?, {1, 2, 3}, become: 1
    after last, {1, 2, 3}, become: 3
    after last?, {1, 2, 3}, become: 3
    after reverse, {1, 2, 3}, become: {3, 2, 1}
    after size, {1, 2, 3}, become: 3
    after to_a, {1, 2, 3}, become: [1, 2, 3]
    after min, {2, 1, 3}, become: 1
    after max, {2, 3, 1}, become: 3
  end
end

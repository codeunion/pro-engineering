require_relative "../textalyze"

# 1. Assert
# 2. Coerce
# 3. Ignore

def characters(string)
  string.split('')
end

# For all String inputs str, the following should hold:
#   str.length == characters(str).length

describe "characters" do
  it "returns an Array" do
    expect(characters("aab")).to be_an(Array)
  end

  it "treats whitespace as characters" do
    expect(characters("a\nb c\td")).to eq(["a", "\n", "b", " ", "\t", "d"])
  end

  # 1. We shouldn't care about the kind of character, e.g., whitespace
  # 2. The order of the characters in the original string should equal
  #    the order of the characters in the returned Array
  # 3. The length of the input string should equal the length of the returned array
  # 4. Maybe something about duplicate or repeated characters
end

describe "item_counts" do
  it "returns an empty Hash when given an empty Array" do
    expect(item_counts([])).to eq({})
  end

  it "differentiates between strings and numbers" do
    expect(item_counts([1, "1", 1])).to eq({1 => 2, "1" => 1})
  end

  it "differentiates between letter cases" do
    expect(item_counts(["a", "A", "a"])).to eq({"a" => 2, "A" => 1})
  end

  it "counts data of any type" do
    expect(item_counts([true, nil, "dinosaur"])).to eq({true => 1, nil => 1, "dinosaur" => 1})
  end

  it "counts repeated instances of the same data" do
    expect(item_counts(["hi", "hi", "hi"])).to eq({"hi" => 3})
  end
end

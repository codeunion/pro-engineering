
# Not great
item_counts(["1", 2]) == {2 => 1, "1" => 1}

# Better
item_counts(["1", 1]) == {1 => 1, "1" => 1}

# Why?

# An empty input should return an empty hash (not nil or 0 or anything else)
p item_counts([]) == {}

# Order shouldn't matter
p item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}
p item_counts([1,1,1,2,2]) == {1 => 3, 2 => 2}

# Case shouldn't matter
p item_counts(["a","a","A","A"]) == {"a" => 2, "A" => 2}

# Should be able to mix arbitrary types
p item_counts([true, nil, "dinosaur"]) == {true => 1, nil => 1, "dinosaur" => 1}

# Maybe a baseline test case?  Something with string length?
p item_counts(["a","b","ZZZ"]) == {"a" => 3, "b" => 2, "ZZZ" => 1}

# Should count repeated values
p item_counts(["hi"]) == {"hi" => 1}
p item_counts(["hi", "hi"]) == {"hi" => 2}
p item_counts(["hi", "hi", "hi"]) == {"hi" => 3}

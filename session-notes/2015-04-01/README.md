# Session Notes: Pro Engineering
## Wednesday, April 1, 2015

### Scott says...

- Read the Rails guides from start to finish, like a book!
- Scaffolding is cool, but don't rely on it too much.

### Questions, etc.



- Test-driven development vs. Behavior-driven development?

- MVC vs. SOA (service-oriented architecture)

- How do I use rspec with my project?
  -- Build textalyzer using TDD (or just w/ tests)

- rspec syntax (wtf)

- QA vs. automated testing vs. other language testing frameworks (e.g., Java)

### What makes for a good test case?

Consider `item_counts`.

- Works for numbers and letters
  item_counts("1", 1) == {1 => 1, "1" => 1}
  item_counts("1", 2) == {2 => 1, "1" => 1}


item_counts([1,2,1,2,1]) == {1 => 3, 2 => 2}

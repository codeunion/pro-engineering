CREATE TABLE votes (
  id SERIAL NOT NULL,
  user_id INTEGER NOT NULL,
  link_id INTEGER NOT NULL,
  score INTEGER NOT NULL
);

-- Give me all the upvotes for a specific link
SELECT * FROM votes WHERE link_id = ? AND score == 1;

-- Give me all the downvotes for a specific link
SELECT * FROM votes WHERE link_id = ? AND score == -1;

-- Give me the total number of upvotes for a specific link
SELECT COUNT(*) FROM votes WHERE link_id = ? AND score == 1;

-- Give me the net vote total for a specific link
SELECT SUM(score) FROM votes WHERE link_id = ?;

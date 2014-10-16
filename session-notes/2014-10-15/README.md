# October 15, 2014

## Reddit Lite™

```text
POST /links/5/vote
score=1

POST /links/10/vote
score=-1

POST /links/:link_id/vote
score=?

POST /links/5/vote
user_id = 10  (this is in the session)
link_id = 5   (this is in the URL)
score = 1     (this is in the POST request's body)
```

### Page

- Homepage
- Add a Link Page
- Sign up page (create a User)
- Sign in page (login)

### User Stories

- As a User, I want to be able to sign up
- As a User, I want to be able to log in
- As a User, I want to be able to post a new Link
- As a User, I want to be able upvote an existing Link
- As a User, I want to be able to downvote an existing Link
- As a User, I want to see a list of all the Links sorted by recency

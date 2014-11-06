# Victor's Sweet Photo Face Off

1. People can create an account to become a User
2. Users can upload photos
3. Users can vote in a Duel
4. Every Duel consists of two photos

users: id
photos: id, user_id, win_count, loss_count
pairings: id, first_photo_id, second_photo_id
duel: id, user_id, pairing_id, winning_photo_id



```text
(user_id, winning_photo_id)
# But we don't know what photo this one was up against

(user_id, first_photo_id, second_photo_id, winning_photo_id)
# Constraint:
#   winning_photo_id = first_photo_id OR winning_photo_id = second_photo_id
# There's no easy way to get per-pairing information
(user_id, first_photo_id, second_photo_id, winning_photo_id)
(1, 5, 6, 6)
(2, 5, 6, 5)
```

```sql
SELECT COUNT(*) FROM duels WHERE winning_photo_id = 5;
```

```sql
SELECT photos.id,
  SUM(winning_photo_id = photos.id) AS win_count,
  SUM(winning_photo_id <> photos.id) AS loss_count
FROM photos
JOIN photo_pairings
  ON (photos.first_photo_id = photos.id OR photos.second_photo_id = photos.id)
JOIN duels
  ON (duels.photo_pairing_id = photo_pairings.id)
GROUP BY photos.id;
```

```text
first_photo_id, second_photo_id
(1,2)
(2,1)
first_photo_id < second_photo_id
```

let's say the new ID is K

(1,5)
(5,1)
(2,5)
(3,5)
(4,5)

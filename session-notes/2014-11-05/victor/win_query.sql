SELECT p.id,
  SUM(d.winning_photo_id = p.id) AS win_count,
  SUM(d.winning_photo_id <> p.id) AS loss_count
FROM photos AS p
JOIN duels_photos AS dp
  ON (p.id = dp.photo_id)
JOIN duels AS d
  ON (d.id = dp.duel_id)
GROUP BY p.id;

SELECT photos.id,
  SUM(winning_photo_id = photos.id) AS win_count,
  SUM(winning_photo_id <> photos.id) AS loss_count
FROM photos
JOIN photo_pairings
  ON (photos.first_photo_id = photos.id OR photos.second_photo_id = photos.id)
JOIN duels
  ON (duels.photo_pairing_id = photo_pairings.id)
GROUP BY photos.id;

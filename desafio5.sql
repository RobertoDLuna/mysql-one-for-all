SELECT m.song_name AS cancao,
COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.history h
JOIN SpotifyClone.songs m
ON m.song_id = h.song_id
GROUP BY m.song_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;
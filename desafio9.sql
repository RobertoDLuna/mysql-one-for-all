SELECT COUNT(DISTINCT h.song_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.history h
JOIN SpotifyClone.users u
ON h.user_id = u.user_id
WHERE u.user_name = 'Barbara Liskov';
SELECT u.user_name AS usuario,COUNT(h.song_id)AS qt_de_musicas_ouvidas,
ROUND(SUM(m.duration_song/60),2) AS total_minutos 
FROM SpotifyClone.users AS u 
JOIN SpotifyClone.history AS h
ON u.user_id = h.user_id 
JOIN SpotifyClone.songs AS m 
ON h.song_id = m.song_id
GROUP BY u.user_name
ORDER BY u.user_name; 
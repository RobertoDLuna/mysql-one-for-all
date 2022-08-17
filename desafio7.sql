SELECT ar.artist_name AS artista, al.album_name AS album, COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.album AS al
JOIN SpotifyClone.artist AS ar
ON ar.artist_id = al.artist_id
JOIN SpotifyClone.following AS f
ON ar.artist_id = f.artist_id
GROUP BY al.album_name, ar.artist_name
ORDER BY seguidores DESC, artista ASC, album ASC;

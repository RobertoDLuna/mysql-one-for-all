SELECT ar.artist_name AS artista, al.album_name AS album
FROM SpotifyClone.artist as ar
JOIN SpotifyClone.album AS al
ON ar.artist_id = al.artist_id
WHERE artist_name = 'Elis Regina';
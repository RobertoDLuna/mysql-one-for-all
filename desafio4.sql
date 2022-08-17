SELECT DISTINCT u.user_name AS usuario,
IF(YEAR(MAX(h.play_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users u
JOIN SpotifyClone.history h
ON u.user_id = h.user_id
GROUP BY u.user_name
ORDER BY u.user_name;
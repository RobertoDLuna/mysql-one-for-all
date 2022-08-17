SELECT ROUND(MIN(p.plan_price), 2) AS faturamento_minimo,
ROUND(MAX(p.plan_price), 2) AS faturamento_maximo,
ROUND(AVG(p.plan_price), 2) AS faturamento_medio,
ROUND(SUM(p.plan_price), 2) AS faturamento_total
FROM SpotifyClone.plans p
JOIN SpotifyClone.users u
ON u.plan_id = p.plan_id;
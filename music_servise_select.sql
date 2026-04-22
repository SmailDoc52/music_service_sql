SELECT t.track_name, t.duration 
FROM track t
ORDER BY duration DESC
LIMIT 1;

SELECT t.track_name
FROM track t
WHERE t.duration >= 210;

SELECT c.collection_name 
FROM collection c 
WHERE c.year_of_release BETWEEN 2018 AND 2020;

SELECT *
FROM executor e 
WHERE e.executor_name NOT LIKE '% %';

SELECT t.track_name
FROM track t
WHERE t.track_name LIKE '% my %'
		OR t.track_name LIKE 'my %'
		OR t.track_name LIKE '% my';

SELECT g.genre_name, COUNT(*)
FROM genre g 
	LEFT JOIN genre_executor ge 
		ON g.genre_id = ge.genre_id 
GROUP BY g.genre_name;

SELECT COUNT(t.track_name) as total_tracks_2019_2020
FROM album a
	LEFT JOIN track t
		ON a.album_id = t.album_id
WHERE a.year_of_release BETWEEN 2019 AND 2020;

SELECT a.album_name, AVG(t.duration) AS avg_duration_seconds
FROM track t 
	LEFT JOIN album a
		ON t.album_id = a.album_id
GROUP BY a.album_name, a.album_id 
ORDER BY a.album_id;

SELECT e.executor_name
FROM executor e
WHERE e.executor_id NOT IN (
	SELECT ae.executor_id 
	FROM album_executor ae
		LEFT JOIN album a 
			ON a.album_id = ae.album_id 
	WHERE a.year_of_release = 2020
);

SELECT DISTINCT c.collection_name 
FROM collection c
	JOIN collection_track ct 
		ON c.collection_id = ct.collection_id
	JOIN track t
		ON t.track_id = ct.track_id
	JOIN album a
		ON a.album_id = t.album_id 
	JOIN album_executor ae 
		ON a.album_id = ae.album_id 
	JOIN executor e 
		ON e.executor_id = ae.executor_id
WHERE e.executor_name = 'Linkin Park';

-- to get total amount of content in db by weight and file type --
SELECT DISTINCT p.Name ContentType, ROUND(SUM(t.Bytes / POW(1024, 2)), 2) TotalMB, 
REPLACE(
	REPLACE(
		REPLACE(
			REPLACE(mt.Name, 'audio file', ''),
			'video file', ''),
		'Protected ', ''),
	'Purchased ', '') FileType
FROM Track t
JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
JOIN PlaylistTrack pt  ON pt.TrackId = t.TrackId
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
GROUP BY p.PlaylistId, ContentType, FileType
ORDER BY TotalMB DESC
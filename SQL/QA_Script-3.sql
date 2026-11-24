-- this script returnes the album with the most songs --
WITH album_counts AS (
	SELECT a2.Name ArtistName, a.Title AlbumTitle, COUNT (t.TrackId) NumOfSongs
	FROM Track t 
	JOIN Album a ON t.AlbumId = a.AlbumId
	JOIN Artist a2 on a.ArtistId = a2.ArtistId
	GROUP BY a.AlbumId, AlbumTitle, ArtistName
	ORDER BY NumOfSongs DESC
)
SELECT ArtistName, AlbumTitle, NumOfSongs
FROM album_counts
WHERE NumOfSongs = (SELECT MAX(NumOfSongs) FROM album_counts);

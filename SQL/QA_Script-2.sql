-- to give the number of tracks for each artist if more than 50 --
SELECT a2.Name, COUNT(t.TrackId) NumOfTracks
FROM Track t 
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Artist a2 on a.ArtistId = a2.ArtistId
GROUP BY a.ArtistId, a2.Name
HAVING NumOfTracks >= 50
ORDER BY NumOfTracks DESC

-- to find top 5 most sold artists by revenue --
SELECT ar.Name AtristName, ROUND(SUM((il.UnitPrice * il.Quantity)), 2) TotalSold
FROM InvoiceLine il
JOIN Track t ON t.TrackId = il.TrackId
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Artist ar ON ar.ArtistId = a.ArtistId
GROUP BY a.ArtistId , AtristName
ORDER BY TotalSold DESC
LIMIT 5
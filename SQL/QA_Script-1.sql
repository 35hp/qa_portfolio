-- To display ONLY Oct 2025, USA, invoices; With customer names and sale rep names --
SELECT i.InvoiceId , DATE(i.InvoiceDate) InvoiceDate,
c.CustomerId, c.FirstName || ' ' || c.LastName CustomerFullName, c.Phone CustomerPhone,
e.FirstName || ' ' || e.LastName SaleRepFullName, e.Phone SaleRepPhone
FROM Invoice i 
JOIN Customer c
ON c.CustomerId = i.CustomerId
JOIN Employee e
ON c.SupportRepId = e.EmployeeId 
WHERE i.InvoiceDate >= '2025-10-00 00:00:00' 
AND  i.InvoiceDate < '2025-11-00 00:00:00' 
AND i.BillingCountry = 'USA'

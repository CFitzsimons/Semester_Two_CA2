SELECT flight.airline, SUM(flight.Seats)
FROM flight, departure
WHERE departure.day = '2002-1-15'
AND flight.no = departure.no
GROUP BY flight.airline
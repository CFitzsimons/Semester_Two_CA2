SELECT * FROM arrival, airport
WHERE arrival.code = airport.code
AND arrival.day = '2002-1-13'
AND arrival.hour >= '10:00'
AND arrival.hour <= '12:00'
ORDER BY arrival.no, airport.name
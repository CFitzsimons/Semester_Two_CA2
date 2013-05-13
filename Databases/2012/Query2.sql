SELECT flight.no, flight.airline
FROM flight, departure dep
WHERE dep.code = 'DUB'
AND flight.no = dep.no
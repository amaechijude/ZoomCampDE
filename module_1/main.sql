Question 3
-- q1
SELECT COUNT (*) 
FROM public.tripdb
WHERE trip_distance <= 1
  AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
  AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

-- q2
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 1
    AND trip_distance <= 3
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

-- q3
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 3
    AND trip_distance <= 7
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

-- q4
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 7
    AND trip_distance <= 10
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

--q5
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 10
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';


-- Question 5
SELECT PULocationID
FROM public.tripdb
WHERE total_amount > 13_000
    AND lpep_pickup_datetime >= '2019-10-18 00: 00: 00'
    AND lpep_pickup_datetime < '2019-10-19 00: 00: 00';